import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/core/common/widgets/spaced_column_widget.dart';
import 'package:nutri_kit/core/enum/view_status.dart';
import 'package:nutri_kit/features/auth/presentation/widgets/auth_field.dart';
import 'package:nutri_kit/features/forgot_password/data/blocs/bloc/forgot_password_bloc.dart';
import 'package:quickalert/quickalert.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isForgotPasswordValid = ValueNotifier(true);
  late ForgotPasswordBloc forgotPasswordBloc;

  @override
  void initState() {
    super.initState();
    forgotPasswordBloc = BlocProvider.of<ForgotPasswordBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        bloc: forgotPasswordBloc,
        listener: (context, state) {
          if (state.viewStatus == ViewStatus.successful) {
            LoadingScreen.instance().show(context: context);
          }

          if (state.viewStatus == ViewStatus.failed ||
              state.viewStatus == ViewStatus.successful) {
            Future.delayed(const Duration(milliseconds: 500), () {
              LoadingScreen.instance().hide();
            });

            if (state.viewStatus == ViewStatus.successful) {
              onPageSuccess(
                  "Successfully sent in your email. Kindly check the spam if you don't see the email");
            }
            if (state.viewStatus == ViewStatus.failed) {
              onFormError('Something went wrong.');
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const Gap(50),
                  Form(
                    key: formKey,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: isForgotPasswordValid,
                            builder: (context, isForgotPasswordValid, child) {
                              return SpacedColumn(
                                children: [
                                  AuthField(
                                    controller: emailController,
                                    hintText: 'Email Address',
                                    validator: (value) {
                                      if (value != null &&
                                          EmailValidator.validate(value)) {
                                        return null;
                                      }
                                      return "Please enter a valid email";
                                    },
                                  ),
                                  if (!isForgotPasswordValid) ...[
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Please enter a valid email',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ],
                              );
                            },
                          ),
                          const Gap(30),
                          ElevatedButton(
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontFamily: 'Signika',
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              isForgotPasswordValid.value = emailController
                                      .text.isNotEmpty &&
                                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(emailController.text);
                              if (isForgotPasswordValid.value) {
                                forgotPasswordBloc.add(
                                  SendForgotPasswordEvent(
                                    email: emailController.text,
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void onPageSuccess(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Forgot Password',
        text: message,
        onConfirmBtnTap: () {
          context.pop();
          Future.delayed(const Duration(milliseconds: 300), () {
            context.pop();
          });
        },
      );
    });
  }

  void onFormError(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: message,
      );
    });
  }
}
