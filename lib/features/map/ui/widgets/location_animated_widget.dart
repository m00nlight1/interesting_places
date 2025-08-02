import 'package:flutter/material.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/colors/app_colors.dart';

class LocationAnimatedWidget extends StatefulWidget {
  const LocationAnimatedWidget({super.key});

  @override
  State<LocationAnimatedWidget> createState() => _LocationAnimatedWidgetState();
}

class _LocationAnimatedWidgetState extends State<LocationAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<double> _secondOpacity;
  late final Animation<double> _scale;
  late final Animation<double> _secondScale;
  late final Animation<double> _centerScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();

    /// Анимация для первого внешнего круга
    _scale = Tween<double>(begin: 0.33, end: 2.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Cubic(0.215, 0.61, 0.355, 1),
      ),
    );
    _opacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.linear),
      ),
    );

    /// Анимация для второго внешнего круга
    _secondScale = Tween<double>(begin: 0.2, end: 3.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Cubic(0.215, 0.61, 0.355, 1)),
      ),
    );
    _secondOpacity = Tween<double>(begin: 0.6, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    /// Анимация для центрального круга
    _centerScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.8), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Cubic(0.455, 0.03, 0.515, 0.955),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _secondScale.value,
                child: Opacity(
                  opacity: _secondOpacity.value,
                  child: SizedBox(
                    width: 104,
                    height: 104,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorTheme.accent.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scale.value,
                child: Opacity(
                  opacity: _opacity.value,
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorTheme.accent.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _centerScale.value,
                child: SizedBox(
                  width: 64,
                  height: 64,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.colorWhiteYellow,
                          AppColors.colorWhiteGreen,
                        ],
                      ),
                      border: Border.all(color: colorTheme.primary, width: 2),
                      boxShadow: [
                        BoxShadow(color: colorTheme.inactive, blurRadius: 8),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
