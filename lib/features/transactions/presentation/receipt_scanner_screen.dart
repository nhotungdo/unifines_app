import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/kawaii_button.dart';

class ReceiptScannerScreen extends StatefulWidget {
  const ReceiptScannerScreen({super.key});

  @override
  State<ReceiptScannerScreen> createState() => _ReceiptScannerScreenState();
}

class _ReceiptScannerScreenState extends State<ReceiptScannerScreen> {
  bool _isScanning = false;

  void _simulateScan() {
    setState(() => _isScanning = true);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _isScanning = false);
        // Show success result...
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Camera backdrop
      appBar: AppBar(
        title: const Text(
          'Quét Hóa Đơn',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          // Mock Camera View
          Center(
            child: Icon(
              Icons.camera_alt_rounded,
              color: Colors.white.withOpacity(0.2),
              size: 100.sp,
            ),
          ),

          // Overlay UI
          SafeArea(
            child: Column(
              children: [
                Spacer(),
                // Scanner Guide box
                Center(
                  child: Container(
                    width: 300.w,
                    height: 400.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.mint, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: _isScanning
                        ? Container(
                                height: 2.h,
                                width: double.infinity,
                                color: AppColors.skyBlue,
                              )
                              .animate(onPlay: (c) => c.repeat(reverse: true))
                              .moveY(
                                begin: 0,
                                end: 396.h,
                                duration: 1.5.seconds,
                              )
                        : null,
                  ),
                ),
                Spacer(),

                // Controls
                Container(
                  padding: EdgeInsets.all(32.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        _isScanning
                            ? 'Đang phân tích hóa đơn...'
                            : 'Căn chỉnh hóa đơn vào khung hình',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.photo_library_rounded),
                            onPressed: () {},
                          ),
                          GestureDetector(
                            onTap: _isScanning ? null : _simulateScan,
                            child: Container(
                              width: 72.w,
                              height: 72.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.mint,
                                  width: 4,
                                ),
                                color: Colors.transparent,
                              ),
                              child: Center(
                                child: Container(
                                  width: 56.w,
                                  height: 56.w,
                                  decoration: const BoxDecoration(
                                    color: AppColors.mint,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.flash_on_rounded),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
