import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app/category/app/ui/category_controller.dart';
import 'package:main_app/gen/assets.gen.dart';
import 'package:main_app/routers/app_pages.dart';
import 'package:main_app/themes/ui_color.dart';
import 'package:main_app/themes/ui_text_style.dart';
import 'package:main_app/widget/list_item_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryControler controler = Get.put(CategoryControler());
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
                        visible: controler.listSelected.isNotEmpty,
                        child: GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.HOME);
                          },
                          child: Text(
                            "Done",
                            style: UITextStyle.white_14_w400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 118),
                Text(
                  "Wellcome to Flutter Test",
                  style: UITextStyle.white_22_w400,
                ),
                const SizedBox(height: 11),
                Text(
                  "Please select categories what you would like to see on your feed. You can set this later on Filter.",
                  style: UITextStyle.white_14_w400.copyWith(color: UIColor.white.withOpacity(0.82)),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Obx(
                    () => ListItemCategory(
                      categories: controler.listCategory,
                      onSelect: (categoryModel) => controler.selectedCategory(categoryModel: categoryModel),
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
