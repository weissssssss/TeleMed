// Flutter package imports
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Screens
import 'package:app/Screens/Login-Signup/Profile_screen.dart';
import 'package:app/Screens/Views/Dashboard_screen.dart';
import 'package:app/Screens/Views/Homepage.dart';
import 'package:app/Screens/Views/Screen1.dart';
import 'package:app/Screens/Views/appointment.dart';
import 'package:app/Screens/Views/chat_screen.dart';
import 'package:app/Screens/Views/doctor_search.dart';
import 'package:app/Screens/Widgets/tab-barPages/message_tab.dart';
import 'package:app/Screens/Widgets/tab-barPages/tab1.dart';
import 'package:app/Screens/Widgets/article.dart';
import 'package:app/Screens/Views/article_page.dart';
import 'package:app/Screens/Widgets/doctor_list.dart';
import 'package:app/Screens/Views/message_Screen.dart';
import 'package:app/Screens/Views/find_doctor.dart';
import 'package:app/Screens/Views/doctor_details_screen.dart';

// Authentication & Settings screens
import 'package:app/Screens/Login-Signup/forgot_password.dart';
import 'package:app/Screens/Login-Signup/login.dart';
import 'package:app/Screens/Login-Signup/login_signup.dart';
import 'package:app/Screens/Login-Signup/sign_up.dart';
import 'package:app/Screens/Login-Signup/verification_code.dart';
import 'package:app/Screens/Login-Signup/schedule_screen.dart';

// Onboarding screens
import 'package:app/Screens/On_Board/on_boarding.dart';


vvoid main() {
  runApp(const Medics());
}

class Medics extends StatelessWidget {
  const Medics({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,  // Hide debug banner in production
          theme: ThemeData(
            primarySwatch: Colors.blue,  // Primary color for the app
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontSize: 16.sp),  // Make font size responsive
            ),
          ),
          initialRoute: '/',  // Set the initial screen to be loaded
          routes: {
            '/': (context) => const Screen1(),  // Home screen
            '/login': (context) => const Login(),  // Login screen
            '/register': (context) => const Register(),  // Registration screen
            '/dashboard': (context) => const DashboardScreen(),  // Dashboard screen
            '/profile': (context) => const ProfileScreen(),  // Profile screen
            '/article': (context) => const ArticlePage(),  // Article page
            // Add other screens here
          },
        );
      },
    );
  }
}

