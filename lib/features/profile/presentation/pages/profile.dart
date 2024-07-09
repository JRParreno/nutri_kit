import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/core/config/shared_prefences_keys.dart';
import 'package:nutri_kit/core/notifier/shared_preferences_notifier.dart';
import 'package:nutri_kit/features/profile/presentation/widgets/profile/profile_list_tile.dart';
import 'package:nutri_kit/features/profile/presentation/widgets/profile/profile_info.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:nutri_kit/router/index.dart';
import 'package:quickalert/quickalert.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileInfo(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Column(
                  children: [
                    ProfileListTile(
                      iconData: Icons.person,
                      onTap: () {},
                      title: 'Edit Profile',
                    ),
                    const SizedBox(height: 15),
                    ProfileListTile(
                      iconData: Icons.star,
                      onTap: () {},
                      title: 'Contact a Nutrionist',
                    ),
                    const SizedBox(height: 15),
                    ProfileListTile(
                      iconData: Icons.settings,
                      onTap: () {},
                      title: 'Community',
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    ProfileListTile(
                      iconData: Icons.star,
                      onTap: () {},
                      title: 'Terms & Privacy Policy',
                    ),
                    const SizedBox(height: 15),
                    ProfileListTile(
                      iconData: Icons.logout_rounded,
                      onTap: handleOnTapLogout,
                      title: 'Logout',
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void handleOnTapLogout() {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
        text: 'Do you want to logout',
        confirmBtnText: 'Yes',
        cancelBtnText: 'No',
        confirmBtnColor: ColorName.primary,
        onConfirmBtnTap: () {
          final sharedPreferencesNotifier =
              GetIt.instance<SharedPreferencesNotifier>();

          sharedPreferencesNotifier.setValue(
              SharedPreferencesKeys.isLoggedIn, false);
          context.read<AppUserCubit>().logout();

          context.go(AppRoutes.login.path);
        });
  }
}
