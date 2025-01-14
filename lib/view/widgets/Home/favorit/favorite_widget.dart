import 'package:flutter/material.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/routes/image_routs.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class FavoriteWidget extends StatelessWidget {
  final String productId;

  const FavoriteWidget({super.key, required this.productId});

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
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                data: 'Product ID: $productId', // API handling remains here
                color: ColorApp.lightMain,
                fontWeight: FontWeight.bold,
                size: 16,
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                data: 'Abo Samer', // Static UI value
                color: ColorApp.lightMain.withOpacity(0.75),
                fontWeight: FontWeight.bold,
                size: 12,
              ),
              const SizedBox(
                height: 8,
              ),
              const TextWidget(
                data: 'Price: \$49', // Static price for UI
                color: ColorApp.lightMain,
                fontWeight: FontWeight.bold,
                size: 16,
              ),
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
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: TextWidget(
                      data: '--',
                      color: ColorApp.darkMain,
                      fontWeight: FontWeight.bold,
                      size: 12,
                    ),
                  ),
                ),
              ),
              const TextWidget(
                data: '0',
                color: ColorApp.lightMain,
                fontWeight: FontWeight.w400,
                size: 16,
              ),
              InkWell(
                child: Container(
                  height: 16,
                  width: 16,
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
            ],
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
    );
  }
}
