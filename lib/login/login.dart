import 'package:ag/create_account/create_account.dart';
import 'package:ag/home_layout/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class Login extends StatefulWidget {
  static const String routName = "Login";

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Form(
            key: provider.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Text('HI',
                    style: GoogleFonts.novaSquare(
                      color: const Color.fromARGB(255, 137, 161, 238),
                      fontSize: 50.sp,
                      letterSpacing: 11.w,
                    )),
                Text("Welcome Back",
                    style: GoogleFonts.novaSquare(
                      color: const Color.fromARGB(255, 137, 161, 238),
                      fontSize: 45.sp,
                    )),
                SizedBox(
                  height: 40.h,
                ),
                TextFormField(
                  validator: (email) {
                    if (email!.isEmpty) {
                      return "Enter Email";
                    }
                    return null;
                  },
                  controller: provider.loginEmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue),
                    ),
                    label: Text("Email",
                        style: GoogleFonts.novaSquare(
                          color: Colors.lightBlue,
                        )),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    suffix: const Icon(
                      Icons.alternate_email,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                TextFormField(
                  validator: (password) {
                    if (password!.isEmpty) {
                      return "Enter Password";
                    }
                    return null;
                  },
                  obscureText: provider.loginObscureTextCheck,
                  controller: provider.loginPasswordController,
                  decoration: InputDecoration(
                      label: Text("Password",
                          style: GoogleFonts.novaSquare(
                            color: Colors.lightBlue,
                          )),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                        ),
                      ),
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffix: InkWell(
                          onTap: () {
                            provider.changeObscureForLogin();
                          },
                          child: provider.loginObscureTextCheck
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.lightBlue,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.lightBlue,
                                ))),
                ),
                SizedBox(
                  height: 40.h,
                ),
                InkWell(
                  onTap: () {
                    if (provider.loginFormKey.currentState!.validate()) {}
                    Navigator.pushNamed(context, HomeLayout.routName);
                  },
                  child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        gradient: const LinearGradient(
                          colors: [Colors.lightBlue, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text("LOGIN",
                            style: GoogleFonts.novaSquare(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.w)),
                      )),
                ),
                MaterialButton(
                  minWidth: 1.w,
                  onPressed: () {},
                  child: Text('Forgot Password ?',
                      style: GoogleFonts.novaSquare(
                        color: Colors.indigo,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w900,
                      )),
                ),
                SizedBox(
                  height: 45.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: GoogleFonts.novaSquare(
                            fontWeight: FontWeight.w600)),
                    MaterialButton(
                      minWidth: 1.w,
                      onPressed: () {
                        Navigator.pushNamed(context, CreateAccount.routName);
                      },
                      child: Text('SIGN UP',
                          style: GoogleFonts.novaSquare(
                            color: Colors.blue,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
