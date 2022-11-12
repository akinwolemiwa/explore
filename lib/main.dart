import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stage_3/colors.dart';
import 'package:stage_3/extensions/agent_theme.dart';
import 'package:stage_3/extensions/context.dart';
import 'package:stage_3/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (BuildContext context, child) => MaterialApp(
          title: 'Explore',
          themeMode: ThemeMode.system,
          theme: AppTheme().light,
          darkTheme: AppTheme().dark,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  void route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: context.isDark ? MyColors.darkTheme : Colors.white,
          ),
          Image.asset(
            context.isDark
                ? 'assets/png/explore_white.png'
                : 'assets/png/ex_logo.png',
            height: 90,
          ),
        ],
      ),
    );
  }
}
