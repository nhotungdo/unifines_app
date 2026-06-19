import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

import 'features/assistant/presentation/floating_unico.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(appRouterProvider);

    return ScreenUtilInit(
      designSize: const Size(390, 844), // Standard iPhone 13/14 size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'UniFines',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.galaxyDarkTheme,
          themeMode: ThemeMode.system,
          routerConfig: goRouter,
          debugShowCheckedModeBanner: false,
          builder: (context, routerChild) {
            return FloatingUnico(child: routerChild!);
          },
        );
      },
    );
  }
}
