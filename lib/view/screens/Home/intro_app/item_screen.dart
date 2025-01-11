import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/introApp/item_controller.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';
import 'package:readmore/readmore.dart';

class ItemScreen extends StatelessWidget {
 const  ItemScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final ItemController controller = Get.put(ItemController());
    // int value = controller.count.value;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.darkMain,
        appBar: AppBar(
          backgroundColor: ColorApp.darkMain,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: ColorApp.lightMain,
                )),
          ],
          centerTitle: true,
          title: const TextWidget(
              data: 'Detail',
              color: ColorApp.lightMain,
              fontWeight: FontWeight.bold,
              size: 24),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorApp.lightMain,
              )),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Container(
              // color: ColorApp.s,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height / 3,
              padding: const EdgeInsetsDirectional.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  controller.item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
              ),
              child: ListView(
                children: [
                   Row(
                    children: [
                      TextWidget(
                          data: controller.item.name,
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.bold,
                          size: 24),
                      const Spacer(),
                      TextWidget(
                          data: '${controller.item.pris}\$',
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.bold,
                          size: 24),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                   Row(
                    children: [
                      TextWidget(
                          data:controller.item.storeName ,
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.w400,
                          size: 20),
                      const Spacer(),
                      const TextWidget(
                          data: 'Location ',
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.w400,
                          size: 20),
                      const Icon(
                        Icons.location_on_outlined,
                        color: ColorApp.mainApp,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                   const TextWidget(
                      data:'Description',
                      color: ColorApp.lightMain,
                      fontWeight: FontWeight.w400,
                      size: 20),
                  const SizedBox(
                    height: 4,
                  ),
                  ReadMoreText(
                    controller.item.description,
                    trimMode: TrimMode.Line,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: ColorApp.lightMain.withOpacity(0.70), height: 2),
                    trimLines: 3,
                    // colorClickableText: Colors.pink,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.mainApp),
                    lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.mainApp),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Obx(
                        () => Row(
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            controller.decremant();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: ColorApp.lightMain.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:Icon(Icons.remove , color: ColorApp.lightMain.withOpacity(0.70),)
                          ),
                        ),
                        const Spacer(),
                        // عرض القيمة الديناميكية
                        TextWidget(
                          data: '${controller.count.value}', // استخدم .value هنا
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.w400,
                          size: 24,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            controller.incremant();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: ColorApp.mainApp,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 14,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  )
,
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const Spacer(flex: 1,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ColorApp.lightMain, width: 2),
                        ),
                        width: 60,
                        height: 46,
                        child: Obx(
                              () => Center(
                            child: TextWidget(
                              data: '${controller.totalPris.value}', // استخدم .value هنا
                              color: ColorApp.lightMain,
                              fontWeight: FontWeight.bold,
                              size: 24,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(flex: 3,),
                      InkWell(
                        child: Container(
                          height: 48,
                          width: 240,
                          decoration: BoxDecoration(
                              color: ColorApp.mainApp,
                              borderRadius: BorderRadius.circular(6)),
                          child: const Row(
                            children: [
                              Spacer(),
                              TextWidget(
                                  data: "Add to Cart",
                                  color: ColorApp.darkMain,
                                  fontWeight: FontWeight.bold,
                                  size: 24),
                              Spacer(),
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: 32,
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(flex: 1,),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
