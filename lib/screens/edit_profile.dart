// import 'package:flutter/material.dart';
// import 'package:shopiee/screens/login_screen.dart';
// import 'package:shopiee/screens/signup_screen.dart';
// import 'package:shopiee/widgets/localdb/databasehelper.dart';

// class EditProfile extends StatefulWidget {
//   final Map<String, dynamic> username;
//   const EditProfile({super.key, required this.username});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phonenoController = TextEditingController();
//   final _doornoController = TextEditingController();
//   final _streetController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _pincodeController = TextEditingController();
//   final _passwordController = TextEditingController();

//   List<Map<String, dynamic>> _users = [];
//   Map<String, dynamic>? _user;

//   // Map<String, dynamic>? user;
//   @override
//   void initState() {
//     super.initState();
//     _refreshUsers();
//     _loadUser();
//   }

//   void _loadUser() async {
//     final user = await DatabaseHelper().getUserByName(widget.username['name']);
//     print('Loaded user: $user');
//     if (user != null) {
//       setState(() {
//         _user = user;
//         _nameController.text = user['name'] ?? '';
//         _emailController.text = user['email'] ?? '';
//         _phonenoController.text = user['phone_no']?.toString() ?? '';
//         _doornoController.text = user['door_no'] ?? '';
//         _streetController.text = user['street'] ?? '';
//         _cityController.text = user['city'] ?? '';
//         _pincodeController.text = user['pincode']?.toString() ?? '';
//         _passwordController.text = user['password'] ?? '';
//       });
//     }
//   }
//   // void _showEditDialog(Map<String, dynamic> user) {
//   //   final emailController = TextEditingController(text: user['email']);
//   //   final nameController = TextEditingController(text: user['name']);
//   //   final phonenoController = TextEditingController(
//   //     text: user['phoneno'].toString(),
//   //   );
//   //   final pincodeController = TextEditingController(
//   //     text: user['pincode'].toString(),
//   //   );
//   //   final passwordController = TextEditingController(text: user['password']);
//   //   final cityController = TextEditingController(text: user['city']);
//   //   final streetController = TextEditingController(text: user['street']);
//   //   final doornoController = TextEditingController(text: user['door_no']);

//   //   showDialog(
//   //     context: context,
//   //     builder: (_) => AlertDialog(
//   //       title: Text('Edit User'),
//   //       content: Column(
//   //         mainAxisSize: MainAxisSize.min,
//   //         children: [
//   //           TextField(
//   //             controller: emailController,
//   //             decoration: InputDecoration(labelText: 'Name'),
//   //           ),
//   //           TextField(
//   //             controller: nameController,
//   //             decoration: InputDecoration(labelText: 'Email'),
//   //           ),
//   //           TextField(
//   //             controller: phonenoController,
//   //             decoration: InputDecoration(labelText: 'Phone no'),
//   //           ),
//   //           TextField(
//   //             controller: doornoController,
//   //             decoration: InputDecoration(labelText: 'Door no'),
//   //           ),
//   //           TextField(
//   //             controller: streetController,
//   //             decoration: InputDecoration(labelText: 'Street'),
//   //           ),
//   //           TextField(
//   //             controller: cityController,
//   //             decoration: InputDecoration(labelText: 'City'),
//   //           ),
//   //           TextField(
//   //             controller: pincodeController,
//   //             decoration: InputDecoration(labelText: 'Pincode'),
//   //           ),
//   //           TextField(
//   //             controller: passwordController,
//   //             decoration: InputDecoration(labelText: 'Password'),
//   //           ),
//   //         ],
//   //       ),
//   //       actions: [
//   //         TextButton(
//   //           onPressed: () async {
//   //             _updateUserByName(
//   //               user['id'],
//   //               emailController.text,
//   //               nameController.text,
//   //               int.tryParse(phonenoController.text) ?? 0,
//   //               doornoController.text,
//   //               streetController.text,
//   //               cityController.text,
//   //               int.tryParse(pincodeController.text) ?? 0,
//   //               passwordController.text,
//   //             );
//   //             Navigator.pop(context);
//   //           },
//   //           child: Text('Save'),
//   //         ),
//   //         TextButton(
//   //           onPressed: () => Navigator.pop(context),
//   //           child: Text('Cancel'),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   void _refreshUsers() async {
//     final data = await DatabaseHelper().getUsers();
//     setState(() {
//       _users = data;
//     });
//   }

//   void _updateUserByName(
//     // int id,
//     String name,
//     String email,
//     int phoneno,
//     String doorno,
//     String street,
//     String city,
//     int pincode,
//     String password,
//   ) async {
//     await DatabaseHelper().updateUserByName({
//       // 'id':id,
//       'name': name,
//       'email': email,
//       'phone_no': phoneno,
//       'door_no': doorno,
//       'street': street,
//       'city': city,
//       'pincode': pincode,
//       'password': password,
//     });
//     _refreshUsers();
//     _nameController.clear();
//     _emailController.clear();
//     _phonenoController.clear();
//     _doornoController.clear();
//     _streetController.clear();
//     _cityController.clear();
//     _pincodeController.clear();
//     _passwordController.clear();
//   }

//   void _deleteUserByName(String name) async {
//     await DatabaseHelper().deleteUserByName(name);
//     //_refreshUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: (){
//           Navigator.pop(context);
//         },
//         icon:Icon(Icons.arrow_back_ios_new_rounded,
//           color: const Color.fromARGB(255, 0, 0, 0),)
          
//         ),
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextFormField(
//           //  initialValue: widget.username['name'],
//             controller: _nameController,
//           //  decoration: InputDecoration(labelText: 'Name'),
//           ),
//           TextField(
//             controller: _emailController,
//            // decoration: InputDecoration(labelText: 'Email'),
//           ),
//           TextField(
//             controller: _phonenoController,
//            // decoration: InputDecoration(labelText: 'Phone no'),
//           ),
//           TextField(
//             controller: _doornoController,
//           //  decoration: InputDecoration(labelText: 'Door no'),
//           ),
//           TextField(
//             controller: _streetController,
//           //  decoration: InputDecoration(labelText: 'Street'),
//           ),
//           TextField(
//             controller: _cityController,
//           //  decoration: InputDecoration(labelText: 'City'),
//           ),
//           TextField(
//             controller: _pincodeController,
//            // decoration: InputDecoration(labelText: 'Pincode'),
//           ),
//           TextField(
//             controller: _passwordController,
//           //  decoration: InputDecoration(labelText: 'Password'),
//           ),
//           TextButton(
//             onPressed: () async {
//               if (_user == null)return;
//               else{
//                 print("BUtton pressed");
//               _updateUserByName(
//                 // _user!['id'],
//                 _user!['name'],
//                 _emailController.text,
//                 int.tryParse(_phonenoController.text) ?? 0,
//                 _doornoController.text,
//                 _streetController.text,
//                 _cityController.text,
//                 int.tryParse(_pincodeController.text) ?? 0,
//                 _passwordController.text,
//               );
//               Navigator.pop(context, true);
//               }
//             },
//             child: Text('Save'),
//           ),
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: (){
//               _deleteUserByName(_user!['name'],);
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
//             } ,
//             child: Text('Delete User'),
//           ),
//         ],
//       ),
//     );
//   }
// }


/////////
/////////
////////
////
///
/////
/// new code 1


// import 'package:flutter/material.dart';
// import 'package:shopiee/screens/login_screen.dart';
// import 'package:shopiee/widgets/localdb/databasehelper.dart';

// class EditProfile extends StatefulWidget {
//   final Map<String, dynamic> username;
//   const EditProfile({super.key, required this.username});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phonenoController = TextEditingController();
//   final _doornoController = TextEditingController();
//   final _streetController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _pincodeController = TextEditingController();
//   final _passwordController = TextEditingController();

//   Map<String, dynamic>? _user;

//   @override
//   void initState() {
//     super.initState();
//     _loadUser();
//   }

//   void _loadUser() async {
//     final user = await DatabaseHelper().getUserByName(widget.username['name']);
//     if (user != null) {
//       setState(() {
//         _user = user;
//         _nameController.text = user['name'] ?? '';
//         _emailController.text = user['email'] ?? '';
//         _phonenoController.text = user['phone_no']?.toString() ?? '';
//         _doornoController.text = user['door_no'] ?? '';
//         _streetController.text = user['street'] ?? '';
//         _cityController.text = user['city'] ?? '';
//         _pincodeController.text = user['pincode']?.toString() ?? '';
//         _passwordController.text = user['password'] ?? '';
//       });
//     }
//   }

//   void _updateUserByName(
//     String name,
//     String email,
//     int phoneno,
//     String doorno,
//     String street,
//     String city,
//     int pincode,
//     String password,
//   ) async {
//     await DatabaseHelper().updateUserByName({
//       'name': name,
//       'email': email,
//       'phone_no': phoneno,
//       'door_no': doorno,
//       'street': street,
//       'city': city,
//       'pincode': pincode,
//       'password': password,
//     });
//   }

//   void _deleteUserByName(String name) async {
//     await DatabaseHelper().deleteUserByName(name);
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => LoginScreen()),
//     );
//   }

//   InputDecoration _inputDecoration(String label) {
//     return InputDecoration(
//       labelText: label,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       filled: true,
//       fillColor: Colors.grey[100],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: Icon(Icons.arrow_back_ios_new_rounded),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               if (_user != null) {
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text('Delete Account'),
//                     content: Text('Are you sure you want to delete this account?'),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: Text('Cancel'),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           _deleteUserByName(_user!['name']);
//                         },
//                         child: Text('Delete', style: TextStyle(color: Colors.red)),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//             },
//             icon: Icon(Icons.delete_forever, color: Colors.red),
//           )
//         ],
//       ),
//       body: _user == null
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.3),
//                           spreadRadius: 2,
//                           blurRadius: 8,
//                           offset: Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           controller: _nameController,
//                           decoration: _inputDecoration('Name'),
//                         ),
//                         SizedBox(height: 12),
//                         TextFormField(
//                           controller: _emailController,
//                           decoration: _inputDecoration('Email'),
//                         ),
//                         SizedBox(height: 12),
//                         TextFormField(
//                           controller: _phonenoController,
//                           decoration: _inputDecoration('Phone Number'),
//                           keyboardType: TextInputType.phone,
//                         ),
//                         SizedBox(height: 12),
//                         TextFormField(
//                           controller: _doornoController,
//                           decoration: _inputDecoration('Door No'),
//                         ),
//                         SizedBox(height: 12),
//                         TextFormField(
//                           controller: _streetController,
//                           decoration: _inputDecoration('Street'),
//                         ),
//                         SizedBox(height: 12),
//                         TextFormField(
//                           controller: _cityController,
//                           decoration: _inputDecoration('City'),
//                         ),
//                         SizedBox(height: 12),
//                         TextFormField(
//                           controller: _pincodeController,
//                           decoration: _inputDecoration('Pincode'),
//                           keyboardType: TextInputType.number,
//                         ),
//                         SizedBox(height: 12),
//                         TextFormField(
//                           controller: _passwordController,
//                           decoration: _inputDecoration('Password'),
//                           obscureText: true,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 24),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       minimumSize: Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 4,
//                     ),
//                     onPressed: () {
//                       if (_user == null) return;
//                       _updateUserByName(
//                         _user!['name'],
//                         _emailController.text,
//                         int.tryParse(_phonenoController.text) ?? 0,
//                         _doornoController.text,
//                         _streetController.text,
//                         _cityController.text,
//                         int.tryParse(_pincodeController.text) ?? 0,
//                         _passwordController.text,
//                       );
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Profile Updated Successfully')),
//                       );
//                     },
//                     child: Text(
//                       'Save',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

////////
////////
////////
////////
////////
///////

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shopiee/screens/login_screen.dart';
// import 'package:shopiee/widgets/localdb/databasehelper.dart';

// class EditProfile extends StatefulWidget {
//   final Map<String, dynamic> username;
//   const EditProfile({super.key, required this.username});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phonenoController = TextEditingController();
//   final _doornoController = TextEditingController();
//   final _streetController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _pincodeController = TextEditingController();
//   final _passwordController = TextEditingController();

//   Map<String, dynamic>? _user;

//   final warmBeige = const Color(0xFFF9F5EF);
//   final warmBrown = const Color(0xFF7B6F61);
//   final cardWhite = Colors.white;
//   final deleteRed = Colors.red.shade700;

//   @override
//   void initState() {
//     super.initState();
//     _loadUser();
//   }

//   void _loadUser() async {
//     final user = await DatabaseHelper().getUserByName(widget.username['name']);
//     if (user != null) {
//       setState(() {
//         _user = user;
//         _nameController.text = user['name'] ?? '';
//         _emailController.text = user['email'] ?? '';
//         _phonenoController.text = user['phone_no']?.toString() ?? '';
//         _doornoController.text = user['door_no'] ?? '';
//         _streetController.text = user['street'] ?? '';
//         _cityController.text = user['city'] ?? '';
//         _pincodeController.text = user['pincode']?.toString() ?? '';
//         _passwordController.text = user['password'] ?? '';
//       });
//     }
//   }

//   void _updateUserByName(
//       String name,
//       String email,
//       int phoneno,
//       String doorno,
//       String street,
//       String city,
//       int pincode,
//       String password) async {
//     await DatabaseHelper().updateUserByName({
//       'name': name,
//       'email': email,
//       'phone_no': phoneno,
//       'door_no': doorno,
//       'street': street,
//       'city': city,
//       'pincode': pincode,
//       'password': password,
//     });
//   }

//   void _deleteUserByName(String name) async {
//     await DatabaseHelper().deleteUserByName(name);
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (_) => LoginScreen()));
//   }

//   InputDecoration _inputDecoration(String label) {
//     return InputDecoration(
//       labelText: label,
//       labelStyle: GoogleFonts.montserrat(color: warmBrown.withOpacity(0.7)),
//       filled: true,
//       fillColor: cardWhite,
//       contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 18.w),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(20.r),
//         borderSide: BorderSide(color: warmBrown.withOpacity(0.3)),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(20.r),
//         borderSide: BorderSide(color: warmBrown, width: 2),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: warmBeige,
//       appBar: AppBar(
//         backgroundColor: warmBeige,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: Icon(Icons.arrow_back_ios_new_rounded, color: warmBrown),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               if (_user != null) {
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text('Delete Account', style: GoogleFonts.montserrat()),
//                     content:
//                         Text('Are you sure you want to delete this account?', style: GoogleFonts.montserrat()),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: Text('Cancel', style: GoogleFonts.montserrat()),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           _deleteUserByName(_user!['name']);
//                         },
//                         child: Text('Delete', style: GoogleFonts.montserrat(color: deleteRed)),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//             },
//             icon: Icon(Icons.delete_forever, color: deleteRed),
//             tooltip: 'Delete Account',
//           ),
//         ],
//       ),
//       body: _user == null
//           ? Center(child: CircularProgressIndicator(color: warmBrown))
//           : SingleChildScrollView(
//               padding: EdgeInsets.all(24.sp),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(20.sp),
//                     decoration: BoxDecoration(
//                       color: cardWhite,
//                       borderRadius: BorderRadius.circular(20.r),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           spreadRadius: 0.5,
//                           blurRadius: 10,
//                           offset: Offset(0, 6),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         _buildTextField(_nameController, 'Name'),
//                         SizedBox(height: 16.h),
//                         _buildTextField(_emailController, 'Email'),
//                         SizedBox(height: 16.h),
//                         _buildTextField(_phonenoController, 'Phone Number',
//                             keyboardType: TextInputType.phone),
//                         SizedBox(height: 16.h),
//                         _buildTextField(_doornoController, 'Door No'),
//                         SizedBox(height: 16.h),
//                         _buildTextField(_streetController, 'Street'),
//                         SizedBox(height: 16.h),
//                         _buildTextField(_cityController, 'City'),
//                         SizedBox(height: 16.h),
//                         _buildTextField(_pincodeController, 'Pincode',
//                             keyboardType: TextInputType.number),
//                         SizedBox(height: 16.h),
//                         _buildTextField(_passwordController, 'Password',
//                             obscureText: true),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30.h),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_user == null) return;
//                       _updateUserByName(
//                         _user!['name'],
//                         _emailController.text,
//                         int.tryParse(_phonenoController.text) ?? 0,
//                         _doornoController.text,
//                         _streetController.text,
//                         _cityController.text,
//                         int.tryParse(_pincodeController.text) ?? 0,
//                         _passwordController.text,
//                       );
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text('Profile Updated Successfully',
//                               style: GoogleFonts.montserrat())));
//                       Navigator.pop(context, true);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: warmBrown,
//                       minimumSize: Size(double.infinity, 50.h),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25.r),
//                       ),
//                       elevation: 6,
//                       shadowColor: warmBrown.withOpacity(0.5),
//                     ),
//                     child: Text(
//                       'Save',
//                       style: GoogleFonts.montserrat(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w600,
//                         color: cardWhite,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   Widget _buildTextField(TextEditingController controller, String label,
//       {TextInputType keyboardType = TextInputType.text, bool obscureText = false}) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       decoration: _inputDecoration(label),
//       style: GoogleFonts.montserrat(
//         fontSize: 16.sp,
//         color: Colors.black87,
//       ),
//       validator: (value) => (value == null || value.isEmpty) ? 'Enter $label' : null,
//     );
//   }
// }
