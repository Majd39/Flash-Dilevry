import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/routes/image_routs.dart';
import 'package:prl_app/model/routes/routes.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class CardStoreWidget extends StatelessWidget {
  const CardStoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(
            10,
            (index) => InkWell(
              
              splashColor: ColorApp.lightMain,
              onTap: (){
                Get.toNamed(Routes.storeScreen);
              },
              child: Card(
                color: ColorApp.s,
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                      top: 12, start: 12, end: 12, bottom: 6),
                  height: 238,
                  width: 164,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorApp.s,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 128,
                        width: 140,
                        // margin: EdgeInsetsDirectional.symmetric(horizontal: 12 , vertical: 8),
                        child: Center(
                          child: Image.asset(ImageRouts.store),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextWidget(
                          data: 'Abo Samer',
                          color: ColorApp.lightMain.withOpacity(0.75),
                          fontWeight: FontWeight.bold,
                          size: 16),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: ColorApp.mainApp,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextWidget(
                              data: 'Damascus , Al-Midan',
                              color: ColorApp.lightMain.withOpacity(0.75),
                              fontWeight: FontWeight.w400,
                              size: 12)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.category_outlined,
                            color: ColorApp.mainApp,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextWidget(
                              data: 'Grocery',
                              color: ColorApp.lightMain.withOpacity(0.75),
                              fontWeight: FontWeight.w400,
                                size: 12)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
