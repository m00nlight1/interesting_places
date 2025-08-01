import 'package:flutter/material.dart';
import 'package:interesting_places/uikit/buttons/entities/button_state.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

class MainButton extends StatelessWidget {
  final ButtonState state;
  final VoidCallback onPressed;
  final Widget child;

  const MainButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.state = ButtonState.active,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorTheme = AppColorTheme.of(context);
    final textStyle = textTheme.button;
    final isLoading = state == ButtonState.loading;

    return FilledButton(
      onPressed: state == ButtonState.active ? onPressed : null,
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(textStyle),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return switch (state) {
            ButtonState.inactive => colorTheme.inactiveVariant,
            _ => colorTheme.accent,
          };
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          return switch (state) {
            ButtonState.inactive => colorTheme.inactive,
            _ => colorTheme.primary,
          };
        }),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20),
        ),
        fixedSize: WidgetStatePropertyAll(Size.fromHeight(48)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Visibility(
            visible: !isLoading,
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: child,
          ),
          if (isLoading) const Positioned(child: _Loader()),
        ],
      ),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader();

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return Center(
      child: SizedBox.square(
        dimension: 24,
        child: CircularProgressIndicator(
          color: colorTheme.primary,
          strokeWidth: 2,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
