import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass_container.dart';

class VoiceInputScreen extends StatefulWidget {
  const VoiceInputScreen({super.key});

  @override
  State<VoiceInputScreen> createState() => _VoiceInputScreenState();
}

class _VoiceInputScreenState extends State<VoiceInputScreen> {
  bool _isListening = false;
  String _recognizedText = "Nhấn giữ để nói...";

  void _onPointerDown(PointerEvent details) {
    setState(() {
      _isListening = true;
      _recognizedText = "Đang nghe...";
    });
    // TODO: Start SpeechToText
  }

  void _onPointerUp(PointerEvent details) {
    setState(() {
      _isListening = false;
      _recognizedText = "Ăn trưa 45k tại cơm tấm Cali"; // Mocked result
    });
    // TODO: Stop SpeechToText and process via AI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nhập liệu bằng Giọng nói')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              GlassContainer(
                width: double.infinity,
                padding: EdgeInsets.all(32.w),
                child: Text(
                  _recognizedText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24.sp,
                    color: _isListening ? AppColors.skyBlue : null,
                  ),
                ),
              ),
              Spacer(),
              Listener(
                onPointerDown: _onPointerDown,
                onPointerUp: _onPointerUp,
                child:
                    Container(
                          width: 120.w,
                          height: 120.w,
                          decoration: BoxDecoration(
                            color: _isListening
                                ? AppColors.skyBlue
                                : AppColors.mint,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    (_isListening
                                            ? AppColors.skyBlue
                                            : AppColors.mint)
                                        .withOpacity(0.4),
                                blurRadius: _isListening ? 30 : 15,
                                spreadRadius: _isListening ? 10 : 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.mic_rounded,
                            size: 60.sp,
                            color: Colors.white,
                          ),
                        )
                        .animate(target: _isListening ? 1 : 0)
                        .scaleXY(
                          end: 1.2,
                          duration: 200.ms,
                          curve: Curves.easeInOut,
                        )
                        .shimmer(
                          duration: 1.seconds,
                          color: Colors.white.withOpacity(0.5),
                        ),
              ),
              SizedBox(height: 48.h),
              Text(
                'Nhấn giữ nút Micro để nói',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
