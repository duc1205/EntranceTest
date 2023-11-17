import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app/category/app/ui/category_controller.dart';
import 'package:main_app/category/domain/model/category_model.dart';
import 'package:main_app/widget/item_category.dart';

class ListItemCategory extends StatefulWidget {
  final List<CategoryModel> categories;
  // final bool isSelected;
  final Function(CategoryModel) onSelect;

  const ListItemCategory({
    super.key,
    required this.categories,
    // required this.isSelected,
    required this.onSelect,
  });

  @override
  State<ListItemCategory> createState() => _ListItemCategoryState();
}

class _ListItemCategoryState extends State<ListItemCategory> {
  CategoryControler controler = Get.put(CategoryControler());
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 109 / 71,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (widget.categories.isNotEmpty) {
                final listCategory = widget.categories[index];
                return Obx(
                  () => ItemCategory(
                    categoryModel: listCategory,
                    isSelected: controler.listSelected.contains(listCategory),
                    onSelect: () => widget.onSelect(listCategory),
                  ),
                );
              }
              return Container();
            },
            childCount: widget.categories.length,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(),
        ),
      ],
    );
  }
}
