import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass_container.dart';
import '../../../shared/widgets/unico_mascot.dart';

class AIChatScreen extends StatelessWidget {
  const AIChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: isDark
                  ? AppColors.galaxyGradient
                  : AppColors.kawaiiGradient,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                const UnicoMascot(size: 50, expression: UnicoExpression.happy),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unico AI',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Luôn sẵn sàng tư vấn tài chính!',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close_rounded, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          // Chat Area (Mocked)
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                _buildMessage(
                  context,
                  'Chào bạn! Mình là Unico. Bạn muốn hỏi gì về tình hình tài chính hôm nay?',
                  isAI: true,
                ),
                SizedBox(height: 16.h),
                _buildMessage(
                  context,
                  'Tháng này mình đã tiêu bao nhiêu tiền ăn uống rồi?',
                  isAI: false,
                ),
                SizedBox(height: 16.h),
                _buildMessage(
                  context,
                  'Trong tháng này bạn đã chi **4.500.000 ₫** cho ăn uống. So với ngân sách 5.000.000 ₫ thì bạn sắp vượt rồi đó nha! Hãy cẩn thận nha! 😰',
                  isAI: true,
                ),
              ],
            ),
          ),

          // Input Area
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Expanded(
                    child: GlassContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 4.h,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Hỏi Unico...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.color,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: AppColors.mint,
                    child: IconButton(
                      icon: const Icon(Icons.send_rounded, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(
    BuildContext context,
    String text, {
    required bool isAI,
  }) {
    return Align(
      alignment: isAI ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isAI
              ? (Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.1)
                    : Colors.white)
              : AppColors.mint,
          borderRadius: BorderRadius.circular(20).copyWith(
            topLeft: isAI
                ? const Radius.circular(0)
                : const Radius.circular(20),
            bottomRight: isAI
                ? const Radius.circular(20)
                : const Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isAI
                ? Theme.of(context).textTheme.bodyLarge?.color
                : Colors.white,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
