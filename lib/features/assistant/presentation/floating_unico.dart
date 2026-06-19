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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          widget.child,
          Positioned(
            left: position.dx,
            top: position.dy,
            child: GestureDetector(
              onTap: () => _openChat(context),
              onPanUpdate: (details) {
                setState(() {
                  final size = MediaQuery.of(context).size;
                  double newX = position.dx + details.delta.dx;
                  double newY = position.dy + details.delta.dy;

                  // Keep it within screen bounds
                  if (newX < 0) newX = 0;
                  if (newX > size.width - 60.w) newX = size.width - 60.w;
                  if (newY < 0) newY = 0;
                  if (newY > size.height - 60.h) newY = size.height - 60.h;

                  position = Offset(newX, newY);
                });
              },
              child: const UnicoMascot(size: 60),
            ),
          ),
        ],
      ),
    );
  }
}
