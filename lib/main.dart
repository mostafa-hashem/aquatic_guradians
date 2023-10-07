import 'package:ag/create_account/create_account.dart';
import 'package:ag/home_layout/home_layout.dart';
import 'package:ag/login/login.dart';
import 'package:ag/provider.dart';
import 'package:ag/show_all/show_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => MyAppProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Login(),
        routes: {
          CreateAccount.routName:(c) => const CreateAccount(),
          Login.routName:(c) => const Login(),
          HomeLayout.routName:(c) => const HomeLayout(),
          ShowAll.routName:(c) => const ShowAll(),
        },
      ),
    );
  }
}
