import 'package:flutter/material.dart';
import 'package:prl_app/model/Clases/category_models.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/routes/image_routs.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget({super.key});

  final List<CategoryModels> categoryList = CategoryModels.categoryList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(
            categoryList.length,
            (index) => Card(
              color: ColorApp.darkMain,
              child: Container(
                padding: const EdgeInsetsDirectional.only(
                  top: 12,
                  start: 12,
                  end: 12,
                  bottom: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: categoryList[index].color,
                      ),
                      height: 128,
                      width: 140,
                      // margin: EdgeInsetsDirectional.symmetric(horizontal: 12 , vertical: 8),
                      child: Center(
                        child: Image.asset(categoryList[index].imageUrl),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextWidget(
                        data: categoryList[index].text,
                        color: ColorApp.lightMain,
                        fontWeight: FontWeight.bold,
                        size: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
