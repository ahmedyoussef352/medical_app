// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/view/screens/paitent_screens/welcome/welcome_screen.dart';
import 'core/cubit/home_layout/cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constant/colors.dart';
import 'core/cubit/home_layout/states.dart';
import 'core/services_shared/bloc_observer.dart';

late SharedPreferences sharedPrefUser;
late SharedPreferences sharedPrefDoc;
late SharedPreferences sharedPrefInfo;
late SharedPreferences sharedPrefid;
late SharedPreferences sharedPrefappoint;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefUser = await SharedPreferences.getInstance();
  sharedPrefDoc = await SharedPreferences.getInstance();
  sharedPrefInfo = await SharedPreferences.getInstance();
  sharedPrefid = await SharedPreferences.getInstance();
   sharedPrefappoint=await SharedPreferences.getInstance();
   WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.android,
  // );
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Doc Spot',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: white,
              appBarTheme: const AppBarTheme(
                  toolbarHeight: 80.0,
                  backwardsCompatibility: false,
                  backgroundColor: white,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black),
                  iconTheme: IconThemeData(color: Colors.black)),
            ),
            home:     const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
