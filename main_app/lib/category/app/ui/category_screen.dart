import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app/category/app/controller/category_controller.dart';
import 'package:main_app/gen/assets.gen.dart';
import 'package:main_app/routers/app_pages.dart';
import 'package:main_app/themes/ui_color.dart';
import 'package:main_app/themes/ui_text_style.dart';
import 'package:main_app/widget/list_item_category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryControler>();
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Assets.resources.images.backgroundCategory.image(),
              Assets.resources.images.backgroundPage.image(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 60, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: categoryController.listSelected.isNotEmpty,
                        child: GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.home);
                          },
                          child: Text(
                            "Done",
                            style: UITextStyle.white14w400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 118),
                Text(
                  "Wellcome to Flutter Test",
                  style: UITextStyle.white22w400,
                ),
                const SizedBox(height: 11),
                Text(
                  "Please select categories what you would like to see on your feed. You can set this later on Filter.",
                  style: UITextStyle.white14w400.copyWith(color: UIColor.white.withOpacity(0.82)),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Obx(
                    () => ListItemCategory(
                      categories: categoryController.listCategory,
                      onSelect: (categoryModel) => categoryController.selectedCategory(categoryModel: categoryModel),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
