import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/bottom_bar.dart';
import '../../../providers/user_provider.dart';
import '../../auth/screens/auth_screen.dart';
import '../../auth/services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;
  // This widget is the root of your application.

  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    loadUserData();
    // Add a delay for the splash screen (e.g., 2 seconds)
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              Provider.of<UserProvider>(context).user.token.isNotEmpty
                  ? const BottomBar()
                  : const AuthScreen(),
        ),
      );
    });
  }

  Future<void> loadUserData() async {
    await authService.getUserData(context);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 150,
          width: 150,
          child: Image.asset('asset/images/lnt_logo.png'),
        ),
      ),
    );
  }
}
