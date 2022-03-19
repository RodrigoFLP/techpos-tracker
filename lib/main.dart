import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/overview_page.dart';
import './providers/sales_stats.dart';
import './screens/category_screen.dart';
import './screens/home_screen.dart';
import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => StatsData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TechPos Track',
        theme: ThemeData(
          fontFamily: 'Sens',
          primaryColor: Color.fromRGBO(17, 28, 53, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
        routes: {
          '/homePage': (ctx) => HomePage(),
          CategoryScreen.routeName: (ctx) => CategoryScreen(),
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
        },
      ),
    );
  }
}
