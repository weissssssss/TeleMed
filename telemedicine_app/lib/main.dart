import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For managing user session
import 'providers/auth_provider.dart';
import 'screens/home_screen.dart';
import 'screens/authentication/login_screen.dart';
import 'screens/appointments_screen.dart';
import 'screens/profile_screen.dart';
import 'utils/app_constants.dart';

void main() {
  runApp(MyTelemedicineApp());
}

class MyTelemedicineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return MaterialApp(
            title: 'Telemedicine App',
            theme: ThemeData(
              primarySwatch: Colors.teal,
              fontFamily: 'Roboto',
              scaffoldBackgroundColor: Colors.grey[100],
              appBarTheme: AppBarTheme(
                color: Colors.teal,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: FutureBuilder(
              future: authProvider.checkAuthStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return authProvider.isAuthenticated
                      ? HomeScreen()
                      : LoginScreen();
                }
              },
            ),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case AppConstants.homeRoute:
                  return _buildPageRoute(HomeScreen());
                case AppConstants.appointmentsRoute:
                  return _buildPageRoute(AppointmentsScreen());
                case AppConstants.profileRoute:
                  return _buildPageRoute(ProfileScreen());
                case AppConstants.loginRoute:
                default:
                  return _buildPageRoute(LoginScreen());
              }
            },
          );
        },
      ),
    );
  }

  Route _buildPageRoute(Widget child) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
