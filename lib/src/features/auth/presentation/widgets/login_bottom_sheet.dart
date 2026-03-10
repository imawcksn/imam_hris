import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:imam_very_good_map/core/theme/app_spacing.dart';
import 'package:imam_very_good_map/shared/widgets/app_primary_action_button.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/form_inputs/email_input.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/form_inputs/password_input.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _LoginErrorText(),
        SizedBox(height: AppSpacing.md),
        _EmailField(),
        SizedBox(height: AppSpacing.md),
        _PasswordField(),
        SizedBox(height: AppSpacing.md),
        _LoginButton(),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
        LoginBloc,
        LoginState,
        ({
          EmailInput email,
        })>(
      selector: (state) => (email: state.email,),
      builder: (context, data) {
        final email = data.email;

        return TextFormField(
          initialValue: email.value,
          textInputAction: TextInputAction.next,
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginEvent.emailChanged(value)),
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: _emailErrorText(email.displayError),
          ),
        );
      },
    );
  }

  String? _emailErrorText(EmailInputError? error) {
    return switch (error) {
      EmailInputError.empty => 'Email cannot be empty.',
      null => null,
      EmailInputError.invalid => 'Please enter a valid email address.',
    };
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState,
        ({PasswordInput password, bool obscure})>(
      selector: (state) =>
          (password: state.password, obscure: state.obscurePassword),
      builder: (context, data) {
        return TextFormField(
          initialValue: data.password.value,
          obscureText: data.obscure,
          textInputAction: TextInputAction.done,
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginEvent.passwordChanged(value)),
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: _passwordErrorText(data.password.displayError),
            suffixIcon: IconButton(
              icon: HugeIcon(
                icon: data.obscure
                    ? HugeIcons.strokeRoundedViewOff
                    : HugeIcons.strokeRoundedView,
              ),
              onPressed: () {
                context
                    .read<LoginBloc>()
                    .add(const LoginEvent.passwordVisibilityToggled());
              },
            ),
          ),
        );
      },
    );
  }

  String? _passwordErrorText(PasswordInputError? error) {
    return switch (error) {
      PasswordInputError.empty => 'Password cannot be empty.',
      null => null,
    };
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, bool>(
      selector: (state) => state.isValid,
      builder: (context, isValid) {
        return AppPrimaryActionButton(
          label: 'Login',
          onPressed: isValid
              ? () =>
                  context.read<LoginBloc>().add(const LoginEvent.submitted())
              : null,
        );
      },
    );
  }
}

class _LoginErrorText extends StatelessWidget {
  const _LoginErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, String?>(
      selector: (state) => state.errorMessage,
      builder: (context, error) {
        if (error == null) return const SizedBox.shrink();

        return Text(
          error,
          style: const TextStyle(color: Colors.red),
        );
      },
    );
  }
}
