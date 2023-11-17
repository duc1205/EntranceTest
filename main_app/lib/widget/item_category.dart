import 'package:flutter/material.dart';
import 'package:main_app/category/domain/model/category_model.dart';
import 'package:main_app/themes/ui_color.dart';
import 'package:main_app/themes/ui_text_style.dart';

class ItemCategory extends StatelessWidget {
  final CategoryModel categoryModel;
  final bool isSelected;
  final Function() onSelect;

  const ItemCategory({
    super.key,
    required this.categoryModel,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(),
      child: Container(
        width: 109,
        height: 71,
        decoration: BoxDecoration(
          border: Border.all(color: UIColor.white.withOpacity(0.12), width: 1),
          borderRadius: BorderRadius.circular(8),
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    const Color(0xFF8A32A9).withOpacity(0.77),
                    const Color(0xFF8A00FF).withOpacity(0.9862),
                  ],
                )
              : null,
        ),
        child: Center(
          child: Text(
            categoryModel.name,
            style: UITextStyle.white_14_w400.copyWith(color: UIColor.white.withOpacity(0.82)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
