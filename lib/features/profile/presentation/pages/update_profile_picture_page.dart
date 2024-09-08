import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/core/common/entities/user.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/features/profile/presentation/bloc/update_profile_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class UpdateProfilePciturePage extends StatefulWidget {
  static const String routeName = 'update-state-picture-screen';

  const UpdateProfilePciturePage({super.key});

  @override
  State<UpdateProfilePciturePage> createState() =>
      _UpdateProfilePciturePageState();
}

class _UpdateProfilePciturePageState extends State<UpdateProfilePciturePage> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Profile Picture',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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

          if (state is UpdateProfileSuccess) {
            onPageSuccess('Successfully updated.');
          }

          if (state is UpdateProfileFailure) {
            onFormError(state.message);
          }
        },
        child: BlocSelector<AppUserCubit, AppUserState, User?>(
          selector: (state) {
            if (state is AppUserLoggedIn) return state.user;

            return null;
          },
          builder: (context, state) {
            if (state == null) {
              return const SizedBox();
            }

            return Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: CircleAvatar(
                        backgroundImage: image != null
                            ? Image.file(File(image!.path)).image
                            : state.profilePhoto != null &&
                                    state.profilePhoto!.isNotEmpty
                                ? NetworkImage(state.profilePhoto!)
                                : null,
                        radius: 100,
                        child: (state.profilePhoto != null &&
                                    state.profilePhoto!.isNotEmpty) ||
                                image != null
                            ? null
                            : const Icon(Icons.person, size: 50),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? pickImage =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        image = pickImage;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color(0xFF1DD0BB),
                      textStyle: const TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Choose from Gallery',
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: image != null ? handleSubmitPhoto : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color(0xFF1DD0BB),
                      textStyle: const TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void handleSubmitPhoto() {
    if (image != null) {
      context.read<UpdateProfileBloc>().add(UpdatePhotoTrigger(image!.path));
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

  void onPageSuccess(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Profile',
        text: message,
      );
    });
  }
}
