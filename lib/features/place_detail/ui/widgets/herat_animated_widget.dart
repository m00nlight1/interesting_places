import 'package:flutter/material.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';

class HeartAnimatedWidget extends StatefulWidget {
  const HeartAnimatedWidget({super.key});

  @override
  HeartAnimatedWidgetState createState() => HeartAnimatedWidgetState();
}

class HeartAnimatedWidgetState extends State<HeartAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<Color?> _color;
  bool _showHeartAnimation = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scale = Tween<double>(
      begin: 1.0,
      end: 2.6,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (mounted) {
          setState(() {
            _showHeartAnimation = false;
          });
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final colorTheme = AppColorTheme.of(context);
    _color = ColorTween(
      begin: colorTheme.primary,
      end: colorTheme.error,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void animate() {
    if (_controller.isAnimating || !mounted) return;

    setState(() {
      _showHeartAnimation = true;
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    if (!_showHeartAnimation) {
      return const SizedBox.shrink();
    }

    return IgnorePointer(
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Transform.scale(
              scale: _scale.value,
              child: Icon(Icons.favorite, color: _color.value),
            );
          },
        ),
      ),
    );
  }
}
