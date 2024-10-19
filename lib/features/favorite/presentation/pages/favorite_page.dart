import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:nutri_kit/router/index.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // itemTile(
            //   title: 'Deficiency',
            //   onTap: () => handleOnTap(AppRoutes.favoriteDeficiency.name),
            // ),
            // const Gap(10),
            // itemTile(
            //   title: 'Remedy',
            //   onTap: () => handleOnTap(AppRoutes.favoriteRemedy.name),
            // ),
            // const Gap(10),
            itemTile(
              title: 'Food',
              onTap: () => handleOnTap(AppRoutes.favoriteFood.name),
            ),
            const Gap(10),
            itemTile(
              title: 'Nutrients',
              onTap: () => handleOnTap(AppRoutes.favoriteVitamin.name),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }

  Widget itemTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorName.miniCardBg,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: ColorName.link,
                fontSize: 20,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: ColorName.link,
            ),
          ],
        ),
      ),
    );
  }

  void handleOnTap(String name) {
    context.pushNamed(name);
  }
}
