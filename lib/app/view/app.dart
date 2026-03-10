import 'package:flutter/material.dart';
import 'package:imam_very_good_map/core/l10n/l10n.dart';
import 'package:imam_very_good_map/core/theme/app_theme.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/pages/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const LoginPage(),
    );
  }
}
