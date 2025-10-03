import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/activity/presentation/pages/welcome_page.dart';
import 'features/activity/presentation/pages/home_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
