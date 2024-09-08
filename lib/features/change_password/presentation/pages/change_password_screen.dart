import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/core/common/widgets/spaced_column_widget.dart';
import 'package:nutri_kit/core/enum/view_status.dart';
import 'package:nutri_kit/features/auth/presentation/widgets/auth_field.dart';
import 'package:nutri_kit/features/change_password/data/blocs/bloc/change_password_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({
    super.key,
  });

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isCurrentPasswordValid = ValueNotifier(true);
  ValueNotifier<bool> isNewPasswordValid = ValueNotifier(true);
  ValueNotifier<bool> isConfirmPasswordValid = ValueNotifier(true);
  late ChangePasswordBloc changePasswordBloc;
  bool isObscureTextPassword = true;
  bool isObscureTextConfirm = true;

  @override
  void initState() {
    super.initState();
    changePasswordBloc = BlocProvider.of<ChangePasswordBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        bloc: changePasswordBloc,
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
              onPageSuccess('Successfully change your password.');
            }
            if (state.viewStatus == ViewStatus.failed) {
              onFormError('Something went wrong.');
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SpacedColumn(
                  spacing: 20,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isCurrentPasswordValid,
                      builder: (context, isCurrentPasswordValid, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthField(
                              controller: currentPassword,
                              hintText: 'Current Password',
                              isObscureText: true,
                            ),
                            if (!isCurrentPasswordValid) ...[
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'This field is required',
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
                    ValueListenableBuilder(
                      valueListenable: isNewPasswordValid,
                      builder: (context, isNewPasswordValid, child) {
                        return SpacedColumn(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthField(
                              controller: newPassword,
                              hintText: 'New Password',
                              isObscureText: isObscureTextPassword,
                              suffixIcon: IconButton(
                                onPressed: () => setState(() =>
                                    isObscureTextPassword =
                                        !isObscureTextPassword),
                                icon: Icon(
                                  isObscureTextPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            if (!isNewPasswordValid) ...[
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'This field is required',
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
                    ValueListenableBuilder(
                      valueListenable: isConfirmPasswordValid,
                      builder: (context, isConfirmPasswordValid, child) {
                        return SpacedColumn(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthField(
                              controller: confirmPassword,
                              hintText: 'Confirm Password',
                              isObscureText: isObscureTextConfirm,
                              suffixIcon: IconButton(
                                onPressed: () => setState(() =>
                                    isObscureTextConfirm =
                                        !isObscureTextConfirm),
                                icon: Icon(
                                  isObscureTextConfirm
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                              validator: (value) {
                                if (value != null) {
                                  return null;
                                }

                                if (newPassword.text != confirmPassword.text) {
                                  return 'Password must be the same';
                                }

                                return "This field is required";
                              },
                            ),
                            if (!isConfirmPasswordValid) ...[
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Password must be the same',
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
                      onPressed: () {
                        isCurrentPasswordValid.value =
                            currentPassword.text.isNotEmpty;
                        isNewPasswordValid.value = newPassword.text.isNotEmpty;
                        isConfirmPasswordValid.value =
                            newPassword.text == confirmPassword.text &&
                                confirmPassword.text.isNotEmpty;

                        if (isCurrentPasswordValid.value &&
                            isNewPasswordValid.value &&
                            isConfirmPasswordValid.value) {
                          changePasswordBloc.add(
                            CallChangePasswordEvent(
                              oldPassword: currentPassword.text,
                              newPassword: newPassword.text,
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontFamily: 'Signika',
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
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
        title: 'Change Password',
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
