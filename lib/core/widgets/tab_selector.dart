import 'package:flutter/material.dart';
import 'package:routiner/core/theme/app_colors.dart';
import 'package:routiner/core/theme/app_text_styles.dart';

class TabSelector extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const TabSelector({
    Key? key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: EdgeInsets.all(3),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: List.generate(
          tabs.length,
              (index) => Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[index],
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: selectedIndex == index
                        ? AppColors.primary
                        : AppColors.black60,
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
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