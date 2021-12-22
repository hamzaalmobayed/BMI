import 'dart:async';
import 'package:bmi_project/provider/provider.dart';
import 'package:bmi_project/routes/Routes.dart';
import 'package:bmi_project/ui/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<BMIProvider>(
      create: (context) => BMIProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: RouteHelper.routeHelper.navKey,
        theme: ThemeData(
          primaryColor: Color(0xff0B85D8),
          buttonTheme: ButtonThemeData(
            padding: EdgeInsets.symmetric(vertical: 20),
            buttonColor: Color(0xff0B85D8), // Background color (orange in my case).
            textTheme: ButtonTextTheme.accent,
            colorScheme:
            Theme.of(context).colorScheme.copyWith(secondary: Colors.white), // Text color
          ),
          fontFamily: "Cairo",
        ),
        home: FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return Center(child: Text("error"));
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return Splash();
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return CircularProgressIndicator();
          },
        ));
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

Color mainColor = Color.fromRGBO(220, 151, 33, 1);

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Provider.of<BMIProvider>(context,listen: false).checkLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/logo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          ),
    );
  }
}
