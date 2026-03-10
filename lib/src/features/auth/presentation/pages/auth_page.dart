import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imam_very_good_map/app/di/injector.dart';
import 'package:imam_very_good_map/core/extensions/context_extension.dart';
import 'package:imam_very_good_map/core/theme/theme.dart';
import 'package:imam_very_good_map/shared/widgets/app_primary_action_button.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/widgets/login_bottom_sheet.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(),
      child: const _AuthPageView(),
    );
  }
}

class _AuthPageView extends StatelessWidget {
  const _AuthPageView();

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
                      const SizedBox(height: AppSpacing.lg),
                      SizedBox(
                        width: double.infinity,
                        child: AppPrimaryActionButton(
                          label: 'Login',
                          onPressed: () {
                            context.showAppBottomSheet<void>(
                              child: BlocProvider.value(
                                value: context.read<LoginBloc>(),
                                child: const LoginBottomSheet(),
                              ),
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
