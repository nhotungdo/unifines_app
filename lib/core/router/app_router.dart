import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/landing_page.dart';
import '../../features/auth/presentation/onboarding_flow.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/transactions/presentation/voice_input_screen.dart';
import '../../features/transactions/presentation/receipt_scanner_screen.dart';
import '../../features/gamification/presentation/tasks_challenges_screen.dart';
import '../../features/gamification/presentation/reward_dashboard_screen.dart';
import '../../features/gamification/presentation/lucky_spin_screen.dart';
import '../../features/shared_funds/presentation/shared_funds_screen.dart';
import '../../features/shared_funds/presentation/fund_detail_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LandingPage()),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingFlow(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/voice-input',
        builder: (context, state) => const VoiceInputScreen(),
      ),
      GoRoute(
        path: '/scanner',
        builder: (context, state) => const ReceiptScannerScreen(),
      ),
      GoRoute(
        path: '/tasks',
        builder: (context, state) => const TasksChallengesScreen(),
      ),
      GoRoute(
        path: '/rewards',
        builder: (context, state) => const RewardDashboardScreen(),
      ),
      GoRoute(
        path: '/lucky-spin',
        builder: (context, state) => const LuckySpinScreen(),
      ),
      GoRoute(
        path: '/shared-funds',
        builder: (context, state) => const SharedFundsScreen(),
      ),
      GoRoute(
        path: '/shared-funds/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return FundDetailScreen(fundId: id);
        },
      ),
    ],
  );
});
