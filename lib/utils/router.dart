import 'package:bettingtips/views/auth/login.dart';
import 'package:bettingtips/views/pages/about.dart';
import 'package:bettingtips/views/pages/dashboard.dart';
import 'package:bettingtips/views/pages/flutter_tips.dart';
import 'package:bettingtips/views/pages/home.dart';
import 'package:bettingtips/views/pages/rate_app.dart';
import 'package:bettingtips/views/pages/refer_a_friend.dart';
import 'package:bettingtips/views/pages/splash_page.dart';
import 'package:bettingtips/views/pages/mylogin.dart';

Object appRoutes = {
  '/': (context) => HomePage(),
//  '/auth': (context) => Router(),

// pages
  '/splash': (context) => SplashScreenPage(),
  '/refer-a-friend': (context) => ReferAFriendPage(),
  '/about': (context) => AboutPage(),
  '/rate-app': (context) => RateApp(),
  '/flutter-tips': (context) => FlutterTipsPage(),

  // auth
  '/login': (context) => LoginScreen(), //LoginPage(),
  '/dashboard': (context) => DashboardPage(),

  // backend
};
