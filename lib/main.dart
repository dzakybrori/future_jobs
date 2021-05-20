import 'package:flutter/material.dart';
import 'package:future_jobs/pages/home_page.dart';
import 'package:future_jobs/pages/onboarding_page.dart';
import 'package:future_jobs/pages/sign_in_page.dart';
import 'package:future_jobs/pages/sign_up_page.dart';
import 'package:future_jobs/pages/splash_page.dart';
import 'package:future_jobs/providers/category_provider.dart';
import 'package:future_jobs/providers/job_provider.dart';
import 'package:provider/provider.dart';
import 'package:future_jobs/providers/auth_provider.dart';
import 'package:future_jobs/providers/user_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (create) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (create) => UserProvider(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (create) => CategoryProvider(),
        ),
        ChangeNotifierProvider<JobProvider>(
          create: (create) => JobProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding': (context) => OnboardingPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
