import 'package:flutter/material.dart';
import 'package:imam_very_good_map/core/theme/app_colors.dart';
import 'package:imam_very_good_map/core/theme/app_spacing.dart';

class AppPrimaryActionButton extends StatefulWidget {
  const AppPrimaryActionButton({
    required this.label,
    this.onPressed,
    super.key,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  bool get isDisabled => onPressed == null;

  @override
  State<AppPrimaryActionButton> createState() => _AppPrimaryActionButtonState();
}

class _AppPrimaryActionButtonState extends State<AppPrimaryActionButton> {
  double _scale = 1;

  void _onTapDown(TapDownDetails _) {
    if (widget.isDisabled || widget.isLoading) return;
    setState(() => _scale = 0.95);
  }

  void _onTapUp(TapUpDetails _) {
    if (widget.isDisabled || widget.isLoading) return;
    setState(() => _scale = 1.0);
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = widget.isDisabled || widget.isLoading;

    final child = widget.isLoading
        ? const SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          )
        : Text(
            widget.label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          );

    return GestureDetector(
      onTap: isDisabled ? null : widget.onPressed,
      onTapDown: isDisabled ? null : _onTapDown,
      onTapUp: isDisabled ? null : _onTapUp,
      onTapCancel: isDisabled ? null : _onTapCancel,
      child: Transform.scale(
        scale: _scale,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: isDisabled ? 0.5 : 1,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
