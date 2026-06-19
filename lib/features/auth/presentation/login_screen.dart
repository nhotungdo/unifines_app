import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass_container.dart';
import '../../../shared/widgets/kawaii_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: Theme.of(context).brightness == Brightness.dark
              ? AppColors.galaxyGradient
              : AppColors.kawaiiGradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GlassContainer(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Đăng nhập',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 32.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    _buildTextField(context, 'Email', Icons.email_rounded),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      context,
                      'Mật khẩu',
                      Icons.lock_rounded,
                      obscureText: true,
                    ),
                    SizedBox(height: 32.h),
                    SizedBox(
                      width: double.infinity,
                      child: KawaiiButton(
                        text: 'Đăng nhập',
                        onPressed: () {
                          // TODO: Implement Auth State
                          context.go('/dashboard');
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    TextButton(
                      onPressed: () {
                        // context.push('/register');
                      },
                      child: Text(
                        'Chưa có tài khoản? Đăng ký ngay',
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String hint,
    IconData icon, {
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.8)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
