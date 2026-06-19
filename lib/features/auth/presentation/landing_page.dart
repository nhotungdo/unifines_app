import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/kawaii_button.dart';
import '../../../shared/widgets/unico_mascot.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: Theme.of(context).brightness == Brightness.dark
              ? AppColors.galaxyGradient
              : AppColors.kawaiiGradient,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const UnicoMascot(
                expression: UnicoExpression.happy,
                size: 150,
              ).animate().fade(duration: 800.ms).scale(delay: 200.ms),
              SizedBox(height: 24.h),
              Text(
                'UniFines',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ).animate().fade(delay: 400.ms).slideY(begin: 0.2),
              SizedBox(height: 12.h),
              Text(
                'Quản lý tài chính đáng yêu\nvà thông minh cùng Unico!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 18.sp,
                ),
              ).animate().fade(delay: 600.ms).slideY(begin: 0.2),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: KawaiiButton(
                        text: 'Bắt đầu ngay',
                        onPressed: () => context.push('/onboarding'),
                      ),
                    ).animate().fade(delay: 800.ms).slideY(begin: 0.2),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      child: KawaiiButton(
                        text: 'Tôi đã có tài khoản',
                        isPrimary: false,
                        onPressed: () => context.push('/login'),
                      ),
                    ).animate().fade(delay: 1000.ms).slideY(begin: 0.2),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
