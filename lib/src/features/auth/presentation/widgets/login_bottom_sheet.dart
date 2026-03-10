import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:imam_very_good_map/core/theme/app_spacing.dart';
import 'package:imam_very_good_map/shared/widgets/app_primary_action_button.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isFormValid = false;

  void _togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _checkForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (isValid != _isFormValid) {
      setState(() {
        _isFormValid = isValid;
      });
    }
  }

  void _submit() {
    if (!_isFormValid) return;

    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    // Send to BLoC
    // context.read<AuthBloc>().add(LoginRequested(username, password));
  }

  String? _usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Minimum 6 characters';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: _checkForm,
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
            ),
            validator: _usernameValidator,
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: HugeIcon(
                  icon: _obscurePassword
                      ? HugeIcons.strokeRoundedViewOff
                      : HugeIcons.strokeRoundedView,
                ),
                onPressed: _togglePassword,
              ),
            ),
            validator: _passwordValidator,
          ),
          const SizedBox(height: AppSpacing.md),
          AppPrimaryActionButton(
            label: 'Sign In',
            onPressed: _isFormValid ? _submit : null,
          ),
        ],
      ),
    );
  }
}
