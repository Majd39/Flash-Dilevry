import 'package:flutter/material.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/routes/image_routs.dart';
import 'package:prl_app/view/widgets/Home/bottun_container_icon_widget.dart';
import 'package:prl_app/view/widgets/Home/favorit/favorite_widget.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorApp.darkMain,
      body: Container(
        margin: const EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BottunContainerIconWidget(),
                const TextWidget(
                    data: 'Favorite',
                    color: ColorApp.lightMain,
                    fontWeight: FontWeight.w400,
                    size: 24),
                Image.asset(
                  ImageRouts.logo,
                  height: 38,
                  width: 38,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: ListView(
                children: [
                  Dismissible(
                    key: const ValueKey(1),
                    background: Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      height: 100,
                      width: 80,
                      color: Colors.redAccent,
                      child: const Center(
                        child: Row(
                          children: [
                            Spacer(flex: 3,),
                            Text('Delete'),
                            Spacer(),
                            Icon(Icons.delete_forever_outlined , size: 50,color: ColorApp.lightMain,),
                          ],
                        ),
                      ),
                    ),
                    child: const FavoriteWidget(),
                  ),
                  Dismissible(
                    key: const ValueKey(2),
                    background: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      height: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text('Delete'),
                      ),
                    ),
                    child: const FavoriteWidget(),
                  ),
                  Dismissible(
                    key: const ValueKey(3),
                    background: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      height: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text('Delete'),
                      ),
                    ),
                    child: const FavoriteWidget(),
                  ),
                  Dismissible(
                    key: const ValueKey(4),
                    background: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      height: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text('Delete'),
                      ),
                    ),
                    child: const FavoriteWidget(),
                  ),
                  Dismissible(
                    key: const ValueKey(5),
                    background: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      height: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text('Delete'),
                      ),
                    ),
                    child: const FavoriteWidget(),
                  ),
                  Dismissible(
                    key: const ValueKey(6),
                    background: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      height: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text('Delete'),
                      ),
                    ),
                    child: const FavoriteWidget(),
                  ),
                  Dismissible(
                    key: const ValueKey(7),
                    background: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      height: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text('Delete'),
                      ),
                    ),
                    child: const FavoriteWidget(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
