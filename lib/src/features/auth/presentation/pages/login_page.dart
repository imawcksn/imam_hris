import 'package:flutter/material.dart';
import 'package:imam_very_good_map/core/extensions/context_extension.dart';
import 'package:imam_very_good_map/core/theme/theme.dart';
import 'package:imam_very_good_map/shared/widgets/app_primary_action_button.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/widgets/login_bottom_sheet.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.surface],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppSpacing.pageHorizontalMargin,
                vertical: AppSpacing.pageVerticalMargin,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const FlutterLogo(size: 120),
                  Column(
                    children: [
                      Text(
                        'Human Resources Information System',
                        style: context.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'lorem ipsum dolor sit amet.',
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: AppSpacing.lg,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: AppPrimaryActionButton(
                          label: 'Login',
                          onPressed: () {
                            context.showAppBottomSheet<void>(
                              child: const LoginBottomSheet(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
