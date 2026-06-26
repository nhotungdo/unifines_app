import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/kawaii_button.dart';
import '../../../shared/widgets/unico_mascot.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Chào mừng bạn!',
      'description':
          'Hãy để UniFines giúp bạn quản lý thu chi một cách vui vẻ nhất.',
      'expression': UnicoExpression.happy,
    },
    {
      'title': 'Mục tiêu tài chính',
      'description':
          'Thiết lập các hũ tiết kiệm và theo dõi hành trình của bạn.',
      'expression': UnicoExpression.thinking,
    },
    {
      'title': 'Sẵn sàng chưa?',
      'description': 'Tạo tài khoản ngay để nhận Unicoin và bắt đầu!',
      'expression': UnicoExpression.defaultState,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(32.w),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UnicoMascot(
                            expression:
                                _pages[index]['expression'] as UnicoExpression,
                            size: 200,
                          ),
                          SizedBox(height: 48.h),
                          Text(
                            _pages[index]['title'] as String,
                            style: Theme.of(
                              context,
                            ).textTheme.displayLarge?.copyWith(fontSize: 28.sp),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            _pages[index]['description'] as String,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(fontSize: 16.sp),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      _pages.length,
                      (index) => Container(
                        margin: EdgeInsets.only(right: 8.w),
                        width: _currentPage == index ? 24.w : 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.mint
                              : AppColors.mint.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  KawaiiButton(
                    text: _currentPage == _pages.length - 1
                        ? 'Bắt đầu'
                        : 'Tiếp tục',
                    onPressed: () {
                      if (_currentPage == _pages.length - 1) {
                        context.go('/login');
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
