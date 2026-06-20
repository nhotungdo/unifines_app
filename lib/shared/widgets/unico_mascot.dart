import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

enum UnicoExpression { happy, thinking, warning, sad, defaultState }

class UnicoMascot extends StatelessWidget {
  final UnicoExpression expression;
  final double size;

  const UnicoMascot({
    super.key,
    this.expression = UnicoExpression.defaultState,
    this.size = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    // Placeholder for actual Lottie animation based on expression.
    // Replace with: Lottie.asset('assets/animations/unico_${expression.name}.json', width: size, height: size);

    IconData icon;
    Color color;

    switch (expression) {
      case UnicoExpression.happy:
        icon = Icons.sentiment_very_satisfied_rounded;
        color = Colors.greenAccent;
        break;
      case UnicoExpression.thinking:
        icon = Icons.sentiment_neutral_rounded;
        color = Colors.blueAccent;
        break;
      case UnicoExpression.warning:
        icon = Icons.sentiment_dissatisfied_rounded;
        color = Colors.orangeAccent;
        break;
      case UnicoExpression.sad:
        icon = Icons.sentiment_very_dissatisfied_rounded;
        color = Colors.redAccent;
        break;
      case UnicoExpression.defaultState:
        icon = Icons.pets_rounded; // Unico is cute!
        color = Colors.purpleAccent;
    }

    return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(icon, size: size * 0.6, color: color),
          ),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scaleXY(end: 1.15, duration: 800.ms, curve: Curves.easeInOutBack)
        .shimmer(duration: 2.seconds);
  }
}
