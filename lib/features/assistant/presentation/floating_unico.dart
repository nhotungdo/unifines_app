import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/widgets/unico_mascot.dart';
import 'ai_chat_screen.dart';

class FloatingUnico extends StatefulWidget {
  final Widget child;

  const FloatingUnico({super.key, required this.child});

  @override
  State<FloatingUnico> createState() => _FloatingUnicoState();
}

class _FloatingUnicoState extends State<FloatingUnico> {
  Offset position = const Offset(20, 100);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize position near bottom right on first load
    final size = MediaQuery.of(context).size;
    position = Offset(size.width - 80.w, size.height - 180.h);
  }

  void _openChat(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AIChatScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Draggable(
            feedback: const UnicoMascot(
              size: 60,
              expression: UnicoExpression.thinking,
            ),
            childWhenDragging: const SizedBox.shrink(),
            onDragEnd: (details) {
              setState(() {
                // Keep it within screen bounds
                final size = MediaQuery.of(context).size;
                double newX = details.offset.dx;
                double newY = details.offset.dy;

                if (newX < 0) newX = 0;
                if (newX > size.width - 60.w) newX = size.width - 60.w;
                if (newY < 0) newY = 0;
                if (newY > size.height - 60.h) newY = size.height - 60.h;

                position = Offset(newX, newY);
              });
            },
            child: GestureDetector(
              onTap: () => _openChat(context),
              child: const UnicoMascot(size: 60),
            ),
          ),
        ),
      ],
    );
  }
}
