import 'package:flutter/material.dart';
import 'package:imam_very_good_map/core/theme/app_colors.dart';
import 'package:imam_very_good_map/shared/widgets/app_buttom_sheet.dart';

extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension BottomSheetExtension on BuildContext {
  Future<T?> showAppBottomSheet<T>({
    required Widget child,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: isScrollControlled,
      backgroundColor: AppColors.surface,
      builder: (_) => AppBottomSheet(child: child),
    );
  }
}
