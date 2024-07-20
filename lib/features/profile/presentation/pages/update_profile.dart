import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/features/auth/presentation/widgets/auth_field.dart';
import 'package:nutri_kit/features/profile/presentation/bloc/update_profile_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final emailCtrl = TextEditingController();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final state = context.read<AppUserCubit>().state;

    if (state is AppUserLoggedIn) {
      emailCtrl.text = state.user.email;
      firstNameCtrl.text = state.user.firstName;
      lastNameCtrl.text = state.user.lastName;
    }
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Update Profile'),
      ),
      body: BlocListener<UpdateProfileBloc, UpdateProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileLoading) {
            LoadingScreen.instance().show(context: context);
          }

          if (state is UpdateProfileFailure || state is UpdateProfileSuccess) {
            Future.delayed(const Duration(milliseconds: 500), () {
              LoadingScreen.instance().hide();
            });
          }

          if (state is UpdateProfileFailure) {
            onFormError(state.message);
          }
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                children: [
                  AuthField(
                    controller: emailCtrl,
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  AuthField(
                    controller: firstNameCtrl,
                    hintText: 'Firstname',
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  AuthField(
                    controller: lastNameCtrl,
                    hintText: 'Lastname',
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  ElevatedButton(
                    onPressed: handleOnSubmitForm,
                    child: const Text(
                      'Update',
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleOnSubmitForm() {
    if (_formKey.currentState!.validate()) {
      context.read<UpdateProfileBloc>().add(
            UpdateProfileTrigger(
              firstName: firstNameCtrl.value.text,
              lastName: lastNameCtrl.value.text,
              email: emailCtrl.value.text,
            ),
          );
    }
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
