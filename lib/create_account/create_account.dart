import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider.dart';

class CreateAccount extends StatelessWidget {
  static const String routName = "CreateAccount";

  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(12.h),
        child: Form(
          key: provider.createAccountFormKey,
          child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Column(
              children: [
                TextFormField(
                  validator: (email) {
                    if (email!.isEmpty) {
                      return "Enter User Name";
                    }
                    bool emailValid = RegExp(
                            r"^[a-zA-Z\d]([._](?![._])|[a-zA-Z\d]){1,18}[a-zA-Z\d]$")
                        .hasMatch(email);
                    if (!emailValid) {
                      return "Enter Valid User Name";
                    }
                    return null;
                  },
                  controller: provider.userNameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue),
                    ),
                    label: Text("User Name",
                        style: GoogleFonts.novaSquare(
                          color: Colors.lightBlue,
                        )),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                TextFormField(
                  validator: (email) {
                    if (email!.isEmpty) {
                      return "Enter Email";
                    }
                    bool emailValid = RegExp(
                            r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+")
                        .hasMatch(email);
                    if (!emailValid) {
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                  controller: provider.createAccountEmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                      ),
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
                SizedBox(height: 30.h),
                TextFormField(
                  validator: (password) {
                    if (password!.isEmpty) {
                      return "Enter Password";
                    } else if (password.length < 6) {
                      return "Password length shouldn't be less than 6 characters";
                    }
                    bool passwordValid = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#$&*~]).{8,}$')
                        .hasMatch(password);
                    if (!passwordValid) {
                      return "Enter Valid Password";
                    }
                    return null;
                  },
                  obscureText: provider.createAccountObscureTextCheck,
                  controller: provider.createAccountPasswordController,
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
                            provider.changeObscureForCreateAccount();
                          },
                          child: provider.createAccountObscureTextCheck
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.lightBlue,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.lightBlue,
                                ))),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  validator: (age) {
                    if (age!.isEmpty) {
                      return "Enter Your Age";
                    }
                    return null;
                  },
                  controller: provider.ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                      ),
                    ),
                    label: Text("Age",
                        style: GoogleFonts.novaSquare(
                          color: Colors.lightBlue,
                        )),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.calendar_month,
                    ),
                    suffix: const Icon(
                      Icons.date_range,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Container(
                  width: 230.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    gradient: const LinearGradient(
                      colors: [Colors.lightBlue, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: MaterialButton(
                      minWidth: 1.w,
                      onPressed: () {
                        if (provider.createAccountFormKey.currentState!
                            .validate()) {}
                      },
                      child: Text('Create Account',
                          style: GoogleFonts.novaSquare(
                            color: Colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w300,
                          ))),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
