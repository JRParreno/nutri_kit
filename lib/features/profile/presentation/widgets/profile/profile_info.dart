import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/core/common/entities/user.dart';
import 'package:nutri_kit/gen/assets.gen.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocSelector<AppUserCubit, AppUserState, User?>(
      selector: (state) {
        if (state is AppUserLoggedIn) return state.user;

        return null;
      },
      builder: (context, state) {
        // if (state == null) return const SizedBox();

        // final profilePhoto = state.profilePhoto;
        const profilePhoto = '';

        return SizedBox(
          height: size.height * 0.25,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: size.height * 0.18,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(50),
                  child: profilePhoto.isEmpty
                      ? Image.asset(Assets.images.profile.defaultProfile.path)
                      : CachedNetworkImage(imageUrl: profilePhoto),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Jhon Rhay Parreño',
                style: TextStyle(fontSize: 25, color: Color(0xff272727)),
              ),
            ],
          ),
        );
      },
    );
  }
}
