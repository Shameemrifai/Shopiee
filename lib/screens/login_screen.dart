// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shopiee/screens/home_screen.dart';
// import 'package:shopiee/screens/signup_screen.dart';
// import 'package:shopiee/widgets/localdb/databasehelper.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController usernamecontroller = TextEditingController();
//   final TextEditingController passwordcontroller = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   bool eye = false;

//   //final String user = "admin";
//   // final String userpassword = "admin@123";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 213, 232),
//       resizeToAvoidBottomInset: false,
//       body: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 100, left: 20),
//               child: Text(
//                 "Welcome \nBack!",
//                 style: TextStyle(
//                   color: Colors.pink,
//                   fontSize: 36.sp,
//                   fontFamily: "Montserrat",
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 10,
//                 ),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: usernamecontroller,
//                       decoration: InputDecoration(
//                         hint: Text(
//                           "User name",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                         prefixIcon: Icon(Icons.person),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.r),
//                           borderSide: BorderSide.none,
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter user name";
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 20.h),
//                     TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter password";
//                         }
//                         return null;
//                       },
//                       controller: passwordcontroller,
//                       obscureText: !eye,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.lock),
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               eye = !eye;
//                             });
//                           },
//                           icon: Icon(
//                             eye
//                                 ? Icons.remove_red_eye
//                                 : Icons.visibility_off_sharp,
//                           ),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.r),
//                           borderSide: BorderSide.none,
//                         ),
//                         hint: Text(
//                           "Password",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         "Forget Password?",
//                         style: GoogleFonts.montserrat(
//                           fontSize: 12.sp,
//                           color: Colors.pink,
//                           //decoration: TextDecoration.underline,
//                           // decorationColor: Colors.pink,
//                           // decorationThickness: 1.5,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 50),
//                     TextButton(
//                       onPressed: () async {
//                         // String username = usernamecontroller.text;
//                         // String password = passwordcontroller.text;
//                         // if (username == user && password == userpassword) {
//                         //   Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //       builder: (context) => HomeScreen(),
//                         //     ),
//                         //   );
//                         // } else {
//                         //   showDialog(
//                         //     context: context,
//                         //     builder: (context) {
//                         //       return AlertDialog(
//                         //         title: Text("Access Denied"),
//                         //         content: Text("Invalid Username or Password"),
//                         //         actions: [
//                         //           TextButton(
//                         //             onPressed: () {
//                         //               Navigator.pop(context);
//                         //             },
//                         //             child: Text("Ok"),
//                         //           ),
//                         //         ],
//                         //       );
//                         //     },
//                         //   );
//                         // }

//                         if (_formKey.currentState!.validate()) {
//                           String name = usernamecontroller.text.trim();
//                           String password = passwordcontroller.text.trim();
//                           final existingUser = await DatabaseHelper()
//                               .getUserByName(name);
//                           if (existingUser == null) {
//                             showDialog(
//                               context: context,
//                               builder: (context) => AlertDialog(
//                                 title: Text("User not found"),
//                                 content: Text(
//                                   "No user found with this email",
//                                 ),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () => Navigator.pop(context),
//                                     child: Text("Ok"),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           } else {
//                             if (existingUser['password'] != password) {
//                               showDialog(
//                                 context: context,
//                                 builder: (context) => AlertDialog(
//                                   title: Text("Incorrect password"),
//                                   content: Text(
//                                     "Please enter the correct password",
//                                   ),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () => Navigator.pop(context),
//                                       child: Text("Ok"),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             } else {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => HomeScreen(userData:existingUser),
//                                 ),
//                               );
//                             }
//                           }

//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) => HomeScreen(),
//                           //   ),
//                           // );
//                         }
//                       },
//                       style: TextButton.styleFrom(
//                         backgroundColor: Colors.pink,
//                         foregroundColor: Colors.white,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 100,
//                           vertical: 12,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadiusGeometry.circular(30),
//                         ),
//                       ),
//                       child: Text(
//                         "Login",
//                         style: GoogleFonts.montserrat(
//                           //  fontFamily: "Montserrat",
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text("Or"),
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Don't have an account? ",
//                           style: GoogleFonts.montserrat(fontSize: 12.sp),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => SignupScreen(),
//                               ),
//                             );
//                           },
//                           style: TextButton.styleFrom(
//                             padding: EdgeInsets.zero,
//                             minimumSize: Size(0, 0),
//                             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                           ),
//                           child: Text(
//                             "Signup",
//                             style: GoogleFonts.montserrat(
//                               color: Colors.pink,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 12.sp,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopiee/screens/home_screen.dart';
import 'package:shopiee/screens/signup_screen.dart';
import 'package:shopiee/widgets/localdb/databasehelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool eye = false;

  // @override
  // void initState() {
  //   _loadUser();
  //   super.initState();
  // }

  // void _loadUser() async {
  //   final users = await DatabaseHelper().getUsers();
  //   print("ALL USERS: $users");
  // }

  @override
  Widget build(BuildContext context) {
    final Color backgroundBeige = Color(0xFFF9F5EF); // soft beige
    final Color cardWhite = Colors.white;
    final Color accentBrown = Color(0xFF7B6F61); // warm brownish gray
    final Color borderGray = Color(0xFFD9CFC2); // soft taupe gray

    return Scaffold(
      backgroundColor: backgroundBeige,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 55.h),
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/image/shopiee.png"),
              ),
              SizedBox(height: 30.h),
              Text(
                "Welcome \nBack!",
                style: GoogleFonts.montserrat(
                  color: Colors.pink,
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.1,
                ),
              ),
              SizedBox(height: 30.h),
              Center(
                child: Column(
                  children: [
                    // Username input
                    TextFormField(
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        hintText: "User name",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        prefixIcon: Icon(Icons.person, color: accentBrown),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.r),
                          //  borderSide: BorderSide(color: borderGray),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: cardWhite,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14.h,
                          horizontal: 18.w,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter user name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    // Password input
                    TextFormField(
                      controller: passwordcontroller,
                      obscureText: !eye,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        prefixIcon: Icon(Icons.lock, color: accentBrown),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              eye = !eye;
                            });
                          },
                          icon: Icon(
                            eye
                                ? Icons.remove_red_eye
                                : Icons.visibility_off_sharp,
                            color: accentBrown,
                          ),
                        ),
                        filled: true,
                        fillColor: cardWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.r),
                          // borderSide: BorderSide(color: borderGray),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14.h,
                          horizontal: 18.w,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget Password?",
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          color: accentBrown,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    // Login button
                    MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String name = usernamecontroller.text.trim();
                          String password = passwordcontroller.text.trim();
                          final existingUser = await DatabaseHelper()
                              .getUserByName(name);
                          print("Users Available $existingUser");
                          if (existingUser == null) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("User not found"),
                                content: Text("No user found with this email"),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Ok"),
                                  ),
                                ],
                              ),
                            );
                          } else if (existingUser['password'] != password) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Incorrect password"),
                                content: Text(
                                  "Please enter the correct password",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Ok"),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString("name", name);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomeScreen(userData: existingUser),
                              ),
                            );
                          }
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      color: Colors.pink,
                      padding: EdgeInsets.symmetric(
                        horizontal: 90.w,
                        vertical: 13.h,
                      ),
                      elevation: 4,
                      child: Text(
                        "Login",
                        style: GoogleFonts.montserrat(
                          color: cardWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      "Or",
                      style: GoogleFonts.montserrat(color: accentBrown),
                    ),
                    SizedBox(height: 13.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.montserrat(
                            fontSize: 12.sp,
                            color: accentBrown,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "Signup",
                            style: GoogleFonts.montserrat(
                              color: Colors.pink[500],
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
