import 'package:flutter/material.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/routes/image_routs.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorApp.s,
      ),
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  ImageRouts.imag,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                  data: 'Pefime',
                  color: ColorApp.lightMain,
                  fontWeight: FontWeight.bold,
                  size: 16),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                  data: 'Abo Samer',
                  color: ColorApp.lightMain.withOpacity(0.75),
                  fontWeight: FontWeight.bold,
                  size: 12),
              const SizedBox(
                height: 8,
              ),
              const TextWidget(
                  data: '49\$',
                  color: ColorApp.lightMain,
                  fontWeight: FontWeight.bold,
                  size: 16),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                      color: ColorApp.lightMain.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(child: const TextWidget(data: '--', color: ColorApp.darkMain, fontWeight: FontWeight.bold, size: 12)),
                ),
              ),
              TextWidget(
                  data: '0',
                  color: ColorApp.lightMain,
                  fontWeight: FontWeight.w400,
                  size: 16),
              InkWell(
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                      color: ColorApp.mainApp,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Icon(Icons.add ,size: 14,),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 24,
          )
        ],
      ),
    );
  }
}
