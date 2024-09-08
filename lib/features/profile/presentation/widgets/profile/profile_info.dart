import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/core/common/entities/user.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/router/index.dart';

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
        if (state == null) return const SizedBox();

        final profilePhoto = state.profilePhoto;

        return GestureDetector(
          onTap: () {
            context.pushNamed(AppRoutes.updatePhoto.name);
          },
          child: SizedBox(
            height: size.height * 0.25,
            width: size.height * 0.25,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: size.height * 0.18,
                  width: size.height * 0.18,
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(50),
                    child: profilePhoto != null && profilePhoto.isEmpty
                        ? Image.asset(Assets.images.profile.defaultProfile.path)
                        : CachedNetworkImage(
                            imageUrl: profilePhoto!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${state.firstName} ${state.lastName} ',
                  style:
                      const TextStyle(fontSize: 25, color: Color(0xff272727)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
