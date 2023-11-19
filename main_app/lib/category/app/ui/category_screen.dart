import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              SizedBox(
                width: double.maxFinite,
                child: Assets.resources.images.backgroundCategory.image(fit: BoxFit.fill),
              ),
              SizedBox(
                width: double.maxFinite,
                child: Assets.resources.images.backgroundPage.image(fit: BoxFit.fill),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 60.h, right: 16.w),
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
                SizedBox(height: 118.h),
                Text(
                  "Wellcome to Flutter Test",
                  style: UITextStyle.white22w400,
                ),
                SizedBox(height: 11.h),
                Text(
                  "Please select categories what you would like to see on your feed. You can set this later on Filter.",
                  style: UITextStyle.white14w400.copyWith(color: UIColor.white.withOpacity(0.82)),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Obx(
                    () => ListItemCategory(
                      categories: categoryController.listCategory,
                      onSelect: (categoryModel) => categoryController.selectedCategory(categoryModel: categoryModel),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
