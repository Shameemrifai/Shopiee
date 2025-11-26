// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shopiee/screens/home_screen.dart';
// import 'package:shopiee/widgets/localdb/databasehelper.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phonenoController = TextEditingController();
//   final _doornoController = TextEditingController();
//   final _streetController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _pincodeController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmController = TextEditingController();
//   List<Map<String, dynamic>> _users = [];
//   bool change = false;
//   bool confirm = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     _refreshUsers();
//     super.initState();
//   }

//   void _refreshUsers() async {
//     final data = await DatabaseHelper().getUsers();
//     setState(() {
//       _users = data;
//     });
//   }

//   Future<void> _addUser() async {
//     final name = _nameController.text.trim();
//     final email = _emailController.text.trim();
//     final phoneno = int.tryParse(_phonenoController.text) ?? 0;
//     final doorno = _doornoController.text.trim();
//     final street = _streetController.text.trim();
//     final city = _cityController.text.trim();
//     final pincode = int.tryParse(_pincodeController.text) ?? 0;
//     final password = _passwordController.text.trim();

//     if (name.isEmpty) return;

//     await DatabaseHelper().insertUser({
//       'name': name,
//       'email': email,
//       'phone_no': phoneno,
//       'door_no': doorno,
//       'street': street,
//       'city': city,
//       'pincode': pincode,
//       'password': password,
//     });
//     _nameController.clear();
//     _emailController.clear();
//     _phonenoController.clear();
//     _doornoController.clear();
//     _streetController.clear();
//     _cityController.clear();
//     _pincodeController.clear();
//     _passwordController.clear();
//     _refreshUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 213, 232),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 255, 213, 232),
//         leadingWidth: 40.sp,
//         automaticallyImplyLeading: false,
//         leading: Padding(
//           padding: EdgeInsets.only(left: 8.sp),
//           child: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.pink),
//           ),
//         ),
//         centerTitle: true,
//         // title: Text("Register",style: GoogleFonts.montserrat(
//         //  fontSize:18.sp
//         // ),)
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Welcome!",
//                   style: GoogleFonts.montserrat(
//                     color: Colors.pink,
//                     fontSize: 36.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 Text(
//                   "Let’s get you started",
//                   style: GoogleFonts.montserrat(
//                     color: Colors.pink,
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(height: 10.h),
//                 inputbox(
//                   validationText: "Enter name",
//                   text: "User name",
//                   controller: _nameController,
//                   icon: Icons.person,
//                 ),
//                 SizedBox(height: 10.h),
//                 inputbox(
//                   validationText: "Enter email",
//                   text: "Email address",
//                   controller: _emailController,
//                   icon: Icons.email_outlined,
//                 ),
//                 SizedBox(height: 10.h),
//                 inputbox(
//                   validationText: "Enter phone",
//                   text: "Phone no",
//                   controller: _phonenoController,
//                   icon: Icons.phone,
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 10.h),
//                 inputbox(
//                   validationText: "Enter door no",
//                   text: "Door",
//                   controller: _doornoController,
//                   icon: Icons.house_rounded,
//                 ),
//                 SizedBox(height: 10.h),
//                 inputbox(
//                   validationText: "Enter street",
//                   text: "Street",
//                   controller: _streetController,
//                   icon: Icons.edit_road,
//                 ),
//                 SizedBox(height: 10.h),
//                 inputbox(
//                   validationText: "Enter city",
//                   text: "City",
//                   controller: _cityController,
//                   icon: Icons.location_city,
//                 ),
//                 SizedBox(height: 10.h),
//                 inputbox(
//                   validationText: "Enter pincode",
//                   text: "Pincode",
//                   controller: _pincodeController,
//                   icon: Icons.pin_drop,
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 10.h),
//                 passwordinput(
//                   validationtext: "Fill password",
//                   text: 'Password',
//                   controller: _passwordController,
//                   isVisible: change,
//                   onToggleVisibility: () {
//                     setState(() {
//                       change = !change;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 10),
//                 passwordinput(
//                   validationtext: "Fill password",
//                   text: 'Confirm password',
//                   controller: _confirmController,
//                   isVisible: confirm,
//                   onToggleVisibility: () {
//                     setState(() {
//                       confirm = !confirm;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 20.h),
//                 Align(
//                   alignment: Alignment.center,
//                   child: TextButton(
//                     onPressed: () async {
//                       if (_formKey.currentState!.validate()) {
//                         String name = _nameController.text.trim();
//                         // String password = _passwordController.text.trim();
//                         // String confirmpassword = _confirmController.text.trim();
//                         final existingUser = await DatabaseHelper()
//                             .getUserByName(name);
//                         if (existingUser != null) {
//                           showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                               title: Text("User already exists"),
//                               content: Text("Try other name"),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () => Navigator.pop(context),
//                                   child: Text("Ok"),
//                                 ),
//                               ],
//                             ),
//                           );
//                           return;
//                         }
//                         if (_confirmController.text.trim() !=
//                             _passwordController.text.trim()) {
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog(
//                                 title: Text(
//                                   "Passwords didn't match",
//                                   style: GoogleFonts.montserrat(
//                                     fontSize: 20.sp,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 content: Text(
//                                   "Please check your password and try again.",
//                                   style: GoogleFonts.montserrat(
//                                     fontSize: 15.sp,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () => Navigator.pop(context),
//                                     child: Text("Ok"),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                           return;
//                         }
//                         await _addUser();
//                         final user = await DatabaseHelper().getUserByName(name);
//                        // print("EXISTING USER $user");
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => HomeScreen(userData: user),
//                           ),
//                         );
//                       }
//                     },
//                     style: TextButton.styleFrom(
//                       foregroundColor: Colors.pink,
//                       backgroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 100,
//                         vertical: 12,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadiusGeometry.circular(30.r),
//                       ),
//                     ),
//                     child: Text(
//                       "Register",
//                       style: GoogleFonts.montserrat(
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   TextFormField passwordinput({
//     required String text,
//     required TextEditingController controller,
//     required bool isVisible,
//     required VoidCallback onToggleVisibility,
//     required String validationtext,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: !isVisible,
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(
//             color: Colors.pink.shade300, // normal border color
//             width: 1.5, // normal width
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(
//             color: Colors.pink, // focused border color
//             width: 1.5, // thicker to “pop”
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(color: Colors.red, width: 2),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(color: Colors.redAccent, width: 3),
//         ),
//         isDense: true,
//         prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.grey[700]),
//         suffixIcon: IconButton(
//           onPressed: onToggleVisibility,
//           icon: Icon(
//             change ? Icons.remove_red_eye : Icons.visibility_off_sharp,
//           ),
//           padding: EdgeInsets.zero,
//         ),
//         hintText: text,
//         hintStyle: TextStyle(color: Colors.grey[500]),
//         filled: true,
//         fillColor: Colors.grey[100],
//         // border: OutlineInputBorder(
//         //   borderRadius: BorderRadius.circular(15.r),
//         //   borderSide: BorderSide(
//         //     color: Colors.pink, // color of the border
//         //     width: 2, // thickness of the border
//         //   ),
//         // ),
//       ),
//       style: TextStyle(color: Colors.black, fontSize: 16.sp),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return validationtext;
//         }

//         return null;
//       },
//     );
//   }

//   TextFormField inputbox({
//     required String text,
//     required TextEditingController controller,
//     TextInputType keyboardType = TextInputType.text,
//     required IconData icon,
//     required String validationText,
//   }) {
//     return TextFormField(
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return validationText;
//         } else {
//           return null;
//         }
//       },
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(
//             color: Colors.pink.shade300, // normal border color
//             width: 1.5, // normal width
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(
//             color: Colors.pink, // focused border color
//             width: 1.5, // thicker to “pop”
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(color: Colors.red, width: 2),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(color: Colors.redAccent, width: 3),
//         ),
//         isDense: true,
//         prefixIcon: Icon(icon),
//         hintText: text,
//         hintStyle: TextStyle(color: Colors.grey[500]),
//         filled: true,
//         fillColor: Colors.grey[100],
//         // border: OutlineInputBorder(
//         //   borderRadius: BorderRadius.circular(15.r),
//         //   borderSide: BorderSide.none,
//         // ),
//       ),
//       style: TextStyle(color: Colors.black, fontSize: 16.sp),
//     );
//   }
// }
/////////
////////
////////
////
//////
/////
////
////
////
///// new code

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shopiee/screens/home_screen.dart';
// import 'package:shopiee/widgets/localdb/databasehelper.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();

//   // Controllers
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phonenoController = TextEditingController();
//   final _doornoController = TextEditingController();
//   final _streetController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _pincodeController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmController = TextEditingController();

//   bool _showPassword = false;
//   bool _showConfirm = false;
//   bool _personalExpanded = true;
//   bool _addressExpanded = false;

//   List<Map<String, dynamic>> _users = [];

//   @override
//   void initState() {
//     super.initState();
//     _refreshUsers();
//   }

//   void _refreshUsers() async {
//     final data = await DatabaseHelper().getUsers();
//     setState(() {
//       _users = data;
//     });
//   }

//   Future<void> _addUser() async {
//     final name = _nameController.text.trim();
//     final email = _emailController.text.trim();
//     final phoneno = int.tryParse(_phonenoController.text) ?? 0;
//     final doorno = _doornoController.text.trim();
//     final street = _streetController.text.trim();
//     final city = _cityController.text.trim();
//     final pincode = int.tryParse(_pincodeController.text) ?? 0;
//     final password = _passwordController.text.trim();

//     if (name.isEmpty) return;

//     await DatabaseHelper().insertUser({
//       'name': name,
//       'email': email,
//       'phone_no': phoneno,
//       'door_no': doorno,
//       'street': street,
//       'city': city,
//       'pincode': pincode,
//       'password': password,
//     });

//     _nameController.clear();
//     _emailController.clear();
//     _phonenoController.clear();
//     _doornoController.clear();
//     _streetController.clear();
//     _cityController.clear();
//     _pincodeController.clear();
//     _passwordController.clear();
//     _confirmController.clear();

//     _refreshUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[50],
//       appBar: AppBar(
//         backgroundColor:  Colors.blue[50],
//         leading: IconButton(onPressed: (){
//           Navigator.pop(context);
//         }, icon: Icon(Icons.arrow_back_ios_new_rounded),color: const Color.fromARGB(255, 0, 0, 0),),
//         // title: Text(
//         //   "Register",
//         //   style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,color: Colors.white),
//         // ),
//         // centerTitle: true,

//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.sp),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 SizedBox(height: 20.h),
//                 Text(
//                   "Let’s get you started",
//                   style: GoogleFonts.montserrat(
//                     fontSize: 26.sp,
//                     fontWeight: FontWeight.w600,
//                     color: const Color.fromARGB(255, 0, 0, 0),
//                   ),
//                 ),
//                 SizedBox(height: 20.h),

//                 // Personal Details Section
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.r),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey,
//                         //spreadRadius: 2,
//                         // blurRadius: 8,
//                         blurRadius: 5,
//                         offset: Offset(0, 4), // shadow position
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15.r),
//                     child: ExpansionPanelList(
//                       expandedHeaderPadding: EdgeInsets.zero,
//                       expansionCallback: (int index, bool isExpanded) {
//                         setState(() {
//                           _personalExpanded = !_personalExpanded;
//                         });
//                       },
//                       children: [
//                         ExpansionPanel(
//                           canTapOnHeader: true,
//                           backgroundColor: Colors.white,
//                           headerBuilder: (context, isExpanded) {
//                             return ListTile(
//                               title: Text(
//                                 "Personal Details",
//                                 style: GoogleFonts.montserrat(
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             );
//                           },
//                           body: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 16.w,
//                               vertical: 8.h,
//                             ),
//                             child: Column(
//                               children: [
//                                 _inputBox(
//                                   "Name",
//                                   _nameController,
//                                   Icons.person,
//                                 ),
//                                 SizedBox(height: 10.h),
//                                 _inputBox(
//                                   "Email",
//                                   _emailController,
//                                   Icons.email_outlined,
//                                   keyboardType: TextInputType.emailAddress,
//                                 ),
//                                 SizedBox(height: 10.h),
//                                 _inputBox(
//                                   "Phone Number",
//                                   _phonenoController,
//                                   Icons.phone,
//                                   keyboardType: TextInputType.phone,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           isExpanded: _personalExpanded,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 10.h),

//                 // Address Details Section
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.r),
//                     boxShadow: [BoxShadow(
//                       color: Colors.grey,
//                      offset: Offset(0, 4),
//                       blurRadius: 5,
//                     )]
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadiusGeometry.circular(15.r),
//                     child: ExpansionPanelList(
//                       expandedHeaderPadding: EdgeInsets.zero,
//                       expansionCallback: (int index, bool isExpanded) {
//                         setState(() {
//                           _addressExpanded = !_addressExpanded;
//                         });
//                       },
//                       children: [
//                         ExpansionPanel(
//                           canTapOnHeader: true,
//                           backgroundColor: Colors.white,
//                           headerBuilder: (context, isExpanded) {
//                             return ListTile(
//                               title: Text(
//                                 "Address Details",
//                                 style: GoogleFonts.montserrat(
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             );
//                           },
//                           body: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 16.w,
//                               vertical: 8.h,
//                             ),
//                             child: Column(
//                               children: [
//                                 _inputBox(
//                                   "Door Number",
//                                   _doornoController,
//                                   Icons.home,
//                                 ),
//                                 SizedBox(height: 10.h),
//                                 _inputBox(
//                                   "Street",
//                                   _streetController,
//                                   Icons.streetview,
//                                 ),
//                                 SizedBox(height: 10.h),
//                                 _inputBox(
//                                   "City",
//                                   _cityController,
//                                   Icons.location_city,
//                                 ),
//                                 SizedBox(height: 10.h),
//                                 _inputBox(
//                                   "Pincode",
//                                   _pincodeController,
//                                   Icons.pin_drop,
//                                   keyboardType: TextInputType.number,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           isExpanded: _addressExpanded,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 20.h),

//                 // Password
//                 _passwordBox(
//                   "Password",
//                   _passwordController,
//                   _showPassword,
//                   () {
//                     setState(() {
//                       _showPassword = !_showPassword;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 10.h),
//                 _passwordBox(
//                   "Confirm Password",
//                   _confirmController,
//                   _showConfirm,
//                   () {
//                     setState(() {
//                       _showConfirm = !_showConfirm;
//                     });
//                   },
//                 ),

//                 SizedBox(height: 30.h),

//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 100,
//                       vertical: 16,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.r),
//                     ),
//                     backgroundColor:  const Color.fromARGB(255, 138, 202, 255),
//                   ),
//                   onPressed: _register,
//                   child: Text(
//                     "Register",
//                     style: GoogleFonts.montserrat(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                       color: Colors.white
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _register() async {
//     if (_formKey.currentState!.validate()) {
//       if (_passwordController.text.trim() != _confirmController.text.trim()) {
//         _showDialog("Passwords did not match");
//         return;
//       }

//       final name = _nameController.text.trim();
//       final existingUser = await DatabaseHelper().getUserByName(name);
//       if (existingUser != null) {
//         _showDialog("User already exists");
//         return;
//       }

//       await _addUser();
//       final user = await DatabaseHelper().getUserByName(name);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen(userData: user)),
//       );
//     }
//   }

//   void _showDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Alert", style: GoogleFonts.montserrat()),
//         content: Text(message, style: GoogleFonts.montserrat()),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("Ok"),
//           ),
//         ],
//       ),
//     );
//   }

//   // Input Box
//   TextFormField _inputBox(
//     String label,
//     TextEditingController controller,
//     IconData icon, {
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       validator: (value) =>
//           value == null || value.isEmpty ? "Enter $label" : null,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: const Color.fromARGB(255, 138, 202, 255)),
//         hintText: label,
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(color: Colors.blue.shade200),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(color: Colors.blue),
//         ),
//       ),
//     );
//   }

//   // Password Box
//   TextFormField _passwordBox(
//     String label,
//     TextEditingController controller,
//     bool visible,
//     VoidCallback toggle,
//   ) {
//     return TextFormField(
//       controller: controller,
//       obscureText: !visible,
//       validator: (value) =>
//           value == null || value.isEmpty ? "Enter $label" : null,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.lock, color: const Color.fromARGB(255, 138, 202, 255),),
//         suffixIcon: IconButton(
//           icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
//           onPressed: toggle,
//         ),
//         hintText: label,
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(color: Colors.blue.shade200),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(color: Colors.blue),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shopiee/screens/home_screen.dart';
// import 'package:shopiee/widgets/localdb/databasehelper.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phonenoController = TextEditingController();
//   final _doornoController = TextEditingController();
//   final _streetController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _pincodeController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmController = TextEditingController();

//   bool _showPassword = false;
//   bool _showConfirm = false;
//   bool _personalExpanded = true;
//   bool _addressExpanded = false;

//   @override
//   void initState() {
//     super.initState();
//     _refreshUsers();
//   }

//   void _refreshUsers() async {
//     final data = await DatabaseHelper().getUsers();
//     setState(() => _users = data);
//   }

//   Future<void> _addUser() async {
//     final name = _nameController.text.trim();
//     final email = _emailController.text.trim();
//     final phoneno = int.tryParse(_phonenoController.text) ?? 0;
//     final doorno = _doornoController.text.trim();
//     final street = _streetController.text.trim();
//     final city = _cityController.text.trim();
//     final pincode = int.tryParse(_pincodeController.text) ?? 0;
//     final password = _passwordController.text.trim();

//     if (name.isEmpty) return;

//     await DatabaseHelper().insertUser({
//       'name': name,
//       'email': email,
//       'phone_no': phoneno,
//       'door_no': doorno,
//       'street': street,
//       'city': city,
//       'pincode': pincode,
//       'password': password,
//     });

//     _nameController.clear();
//     _emailController.clear();
//     _phonenoController.clear();
//     _doornoController.clear();
//     _streetController.clear();
//     _cityController.clear();
//     _pincodeController.clear();
//     _passwordController.clear();
//     _confirmController.clear();

//     _refreshUsers();
//   }

//   void _register() async {
//     if (_formKey.currentState!.validate()) {
//       if (_passwordController.text.trim() != _confirmController.text.trim()) {
//         _showDialog("Passwords did not match");
//         return;
//       }

//       final name = _nameController.text.trim();
//       final existingUser = await DatabaseHelper().getUserByName(name);
//       if (existingUser != null) {
//         _showDialog("User already exists");
//         return;
//       }

//       await _addUser();
//       final user = await DatabaseHelper().getUserByName(name);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen(userData: user)),
//       );
//     }
//   }

//   void _showDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Alert", style: GoogleFonts.montserrat()),
//         content: Text(message, style: GoogleFonts.montserrat()),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("Ok", style: GoogleFonts.montserrat()),
//           ),
//         ],
//       ),
//     );
//   }

//   List<Map<String, dynamic>> _users = [];

//   @override
//   Widget build(BuildContext context) {
//     final beige = Color(0xFFF9F5EF);
//     final cardWhite = Colors.white;
//     final warmBrown = Color(0xFF7B6F61);
//     final borderGray = Color(0xFFD9CFC2);
//     final blackText = Colors.black87;

//     return Scaffold(
//       backgroundColor: beige,
//       appBar: AppBar(
//         leading: IconButton(onPressed: (){
//           Navigator.pop(context);
//         }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,)),
//         backgroundColor: beige,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Let’s get you started",
//                   style: GoogleFonts.montserrat(
//                     fontSize: 28.sp,
//                     fontWeight: FontWeight.w700,
//                     color: blackText,
//                   ),
//                 ),
//                 SizedBox(height: 30.h),

//                 _buildExpansionPanel(
//                     title: "Personal Details",
//                     isExpanded: _personalExpanded,
//                     onToggle: () => setState(() => _personalExpanded = !_personalExpanded),
//                     body: Column(
//                       children: [
//                         _buildInput(
//                             label: "Name",
//                             controller: _nameController,
//                             icon: Icons.person,
//                             iconColor: warmBrown,
//                             borderColor: borderGray),
//                         SizedBox(height: 16.h),
//                         _buildInput(
//                             label: "Email",
//                             controller: _emailController,
//                             icon: Icons.email_outlined,
//                             iconColor: warmBrown,
//                             borderColor: borderGray,
//                             keyboardType: TextInputType.emailAddress),
//                         SizedBox(height: 16.h),
//                         _buildInput(
//                             label: "Phone Number",
//                             controller: _phonenoController,
//                             icon: Icons.phone,
//                             iconColor: warmBrown,
//                             borderColor: borderGray,
//                             keyboardType: TextInputType.phone),
//                       ],
//                     )),

//                 SizedBox(height: 24.h),

//                 _buildExpansionPanel(
//                     title: "Address Details",
//                     isExpanded: _addressExpanded,
//                     onToggle: () => setState(() => _addressExpanded = !_addressExpanded),
//                     body: Column(
//                       children: [
//                         _buildInput(
//                             label: "Door Number",
//                             controller: _doornoController,
//                             icon: Icons.home,
//                             iconColor: warmBrown,
//                             borderColor: borderGray),
//                         SizedBox(height: 16.h),
//                         _buildInput(
//                             label: "Street",
//                             controller: _streetController,
//                             icon: Icons.streetview,
//                             iconColor: warmBrown,
//                             borderColor: borderGray),
//                         SizedBox(height: 16.h),
//                         _buildInput(
//                             label: "City",
//                             controller: _cityController,
//                             icon: Icons.location_city,
//                             iconColor: warmBrown,
//                             borderColor: borderGray),
//                         SizedBox(height: 16.h),
//                         _buildInput(
//                             label: "Pincode",
//                             controller: _pincodeController,
//                             icon: Icons.pin_drop,
//                             iconColor: warmBrown,
//                             borderColor: borderGray,
//                             keyboardType: TextInputType.number),
//                       ],
//                     )),

//                 SizedBox(height: 30.h),

//                 _buildPasswordInput(
//                     label: "Password",
//                     controller: _passwordController,
//                     showText: _showPassword,
//                     toggleVisibility: () => setState(() => _showPassword = !_showPassword),
//                     iconColor: warmBrown,
//                     borderColor: borderGray),

//                 SizedBox(height: 16.h),

//                 _buildPasswordInput(
//                     label: "Confirm Password",
//                     controller: _confirmController,
//                     showText: _showConfirm,
//                     toggleVisibility: () => setState(() => _showConfirm = !_showConfirm),
//                     iconColor: warmBrown,
//                     borderColor: borderGray),

//                 SizedBox(height: 36.h),

//                 SizedBox(
//                   width: double.infinity,
//                   height: 50.h,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: warmBrown,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                       ),
//                     ),
//                     onPressed: _register,
//                     child: Text(
//                       "Register",
//                       style: GoogleFonts.montserrat(
//                           fontSize: 18.sp, fontWeight: FontWeight.w600, color: cardWhite),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildExpansionPanel({
//     required String title,
//     required bool isExpanded,
//     required VoidCallback onToggle,
//     required Widget body,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 8,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: ExpansionPanelList(
//         elevation: 0,
//         expandedHeaderPadding: EdgeInsets.zero,
//         expansionCallback: (_, __) => onToggle(),
//         children: [
//           ExpansionPanel(
//             canTapOnHeader: true,
//             backgroundColor: Colors.white,
//             headerBuilder: (context, _) {
//               return ListTile(
//                 title: Text(
//                   title,
//                   style: GoogleFonts.montserrat(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 18.sp,
//                   ),
//                 ),
//               );
//             },
//             body: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//               child: body,
//             ),
//             isExpanded: isExpanded,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInput({
//     required String label,
//     required TextEditingController controller,
//     required IconData icon,
//     required Color iconColor,
//     required Color borderColor,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       validator: (value) => (value == null || value.isEmpty) ? "Enter $label" : null,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: iconColor),
//         hintText: label,
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.r),
//             borderSide: BorderSide(color: borderColor)),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.r),
//             borderSide: BorderSide(color: iconColor, width: 2)),
//       ),
//       style: TextStyle(color: Colors.black87, fontSize: 16.sp),
//     );
//   }

//   Widget _buildPasswordInput({
//     required String label,
//     required TextEditingController controller,
//     required bool showText,
//     required VoidCallback toggleVisibility,
//     required Color iconColor,
//     required Color borderColor,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: !showText,
//       validator: (value) => (value == null || value.isEmpty) ? "Enter $label" : null,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.lock, color: iconColor),
//         suffixIcon: IconButton(
//           icon: Icon(showText ? Icons.visibility : Icons.visibility_off),
//           onPressed: toggleVisibility,
//         ),
//         hintText: label,
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.r),
//             borderSide: BorderSide(color: borderColor)),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.r),
//             borderSide: BorderSide(color: iconColor, width: 2)),
//       ),
//       style: TextStyle(color: Colors.black87, fontSize: 16.sp),
//     );
//   }
// }

////////
////////
////
////
////
/////
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopiee/screens/home_screen.dart';
import 'package:shopiee/widgets/localdb/databasehelper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phonenoController = TextEditingController();
  final _doornoController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _showPassword = false;
  bool _showConfirm = false;
  bool _personalExpanded = true;
  bool _addressExpanded = false;
  List<Map<String, dynamic>> _users = [];

  @override
  void initState() {
    super.initState();
    _refreshUsers();
  }

  void _refreshUsers() async {
    final data = await DatabaseHelper().getUsers();
    setState(() => _users = data);
  }

  Future<void> _addUser() async {
    final user = {
      'name': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'phone_no': int.tryParse(_phonenoController.text) ?? 0,
      'door_no': _doornoController.text.trim(),
      'street': _streetController.text.trim(),
      'city': _cityController.text.trim(),
      'pincode': int.tryParse(_pincodeController.text) ?? 0,
      'password': _passwordController.text.trim(),
    };
    await DatabaseHelper().insertUser(user);
    _clearAll();
    _refreshUsers();
  }

  void _clearAll() {
    _nameController.clear();
    _emailController.clear();
    _phonenoController.clear();
    _doornoController.clear();
    _streetController.clear();
    _cityController.clear();
    _pincodeController.clear();
    _passwordController.clear();
    _confirmController.clear();
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text.trim() != _confirmController.text.trim()) {
        _showDialog("Passwords did not match");
        return;
      }
      final name = _nameController.text.trim();
      final existingUser = await DatabaseHelper().getUserByName(name);
      if (existingUser != null) {
        _showDialog("User already exists");
        return;
      }
      await _addUser();
      final user = await DatabaseHelper().getUserByName(name);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("name", name);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(userData: user)),
      );
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Alert", style: GoogleFonts.montserrat()),
        content: Text(message, style: GoogleFonts.montserrat()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK", style: GoogleFonts.montserrat()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFFE91E63);
    final background = const Color(0xFFF9F5EF);
    final textColor = Colors.black87;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.pink,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Your Account",
                  style: GoogleFonts.montserrat(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Fill in your details below to continue",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 15.sp,
                    color: const Color(0xFFE91E63),
                  ),
                ),
                SizedBox(height: 30.h),
                _buildAccordion(
                  title: "Personal Details",
                  expanded: _personalExpanded,
                  onTap: () =>
                      setState(() => _personalExpanded = !_personalExpanded),
                  children: [
                    _buildTextField(
                      "Name",
                      _nameController,
                      Icons.person,
                      primaryColor,
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      "Email",
                      _emailController,
                      Icons.email_outlined,
                      primaryColor,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      "Phone Number",
                      _phonenoController,
                      Icons.phone,
                      primaryColor,
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                _buildAccordion(
                  title: "Address Details",
                  expanded: _addressExpanded,
                  onTap: () =>
                      setState(() => _addressExpanded = !_addressExpanded),
                  children: [
                    _buildTextField(
                      "Door Number",
                      _doornoController,
                      Icons.home,
                      primaryColor,
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      "Street",
                      _streetController,
                      Icons.streetview,
                      primaryColor,
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      "City",
                      _cityController,
                      Icons.location_city,
                      primaryColor,
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      "Pincode",
                      _pincodeController,
                      Icons.pin_drop,
                      primaryColor,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                _buildPasswordField(
                  _passwordController,
                  "Password",
                  _showPassword,
                  () {
                    setState(() => _showPassword = !_showPassword);
                  },
                  primaryColor,
                ),
                SizedBox(height: 16.h),
                _buildPasswordField(
                  _confirmController,
                  "Confirm Password",
                  _showConfirm,
                  () {
                    setState(() => _showConfirm = !_showConfirm);
                  },
                  primaryColor,
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      elevation: 6,
                      shadowColor: primaryColor.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    child: Text(
                      "Register",
                      style: GoogleFonts.montserrat(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 15.sp,
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "Log in",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 15.sp,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccordion({
    required String title,
    required bool expanded,
    required VoidCallback onTap,
    required List<Widget> children,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
          ),
        ),
        iconColor: Colors.pinkAccent,
        childrenPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        onExpansionChanged: (_) => onTap(),
        initiallyExpanded: expanded,
        children: children,
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon,
    Color color, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) =>
          value == null || value.isEmpty ? "Enter $label" : null,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: color),
        hintText: label,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18.r)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(color: color, width: 2),
        ),
      ),
      style: GoogleFonts.nunitoSans(fontSize: 16.sp, color: Colors.black87),
    );
  }

  Widget _buildPasswordField(
    TextEditingController controller,
    String label,
    bool show,
    VoidCallback toggle,
    Color color,
  ) {
    return TextFormField(
      controller: controller,
      obscureText: !show,
      validator: (value) =>
          value == null || value.isEmpty ? "Enter $label" : null,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline, color: color),
        suffixIcon: IconButton(
          icon: Icon(
            show ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: toggle,
        ),
        hintText: label,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18.r)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(color: color, width: 2),
        ),
      ),
      style: GoogleFonts.nunitoSans(fontSize: 16.sp, color: Colors.black87),
    );
  }
}
