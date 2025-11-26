import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopiee/screens/login_screen.dart';
import 'package:shopiee/widgets/localdb/databasehelper.dart';

class ProfileScreen extends StatefulWidget {
  final Map<String, dynamic> username;
  const ProfileScreen({super.key, required this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? _user;
  bool _isEditing = false;

  // Text controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _doorController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _passwordController = TextEditingController(); // ✅ Added

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() async {
    final user = await DatabaseHelper().getUserByName(widget.username['name']);
    if (user != null) {
      setState(() {
        _user = user;
        _nameController.text = user['name'] ?? '';
        _emailController.text = user['email'] ?? '';
        _phoneController.text = user['phone_no']?.toString() ?? '';
        _doorController.text = user['door_no'] ?? '';
        _streetController.text = user['street'] ?? '';
        _cityController.text = user['city'] ?? '';
        _pincodeController.text = user['pincode']?.toString() ?? '';
        _passwordController.text = user['password'] ?? ''; // ✅ Added
      });
    }
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("name");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Future<void> _saveChanges() async {
    if (_user == null) return;
    await DatabaseHelper().updateUserByName({
      'name': _nameController.text,
      'email': _emailController.text,
      'phone_no': int.tryParse(_phoneController.text) ?? 0,
      'door_no': _doorController.text,
      'street': _streetController.text,
      'city': _cityController.text,
      'pincode': int.tryParse(_pincodeController.text) ?? 0,
      'password': _passwordController.text, // ✅ Save password too
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Profile updated successfully!",
          style: GoogleFonts.montserrat(),
        ),
      ),
    );

    setState(() => _isEditing = false);
    _loadUser();
  }

  void _cancelEditing() {
    setState(() {
      _isEditing = false;
      _nameController.text = _user?['name'] ?? '';
      _emailController.text = _user?['email'] ?? '';
      _phoneController.text = _user?['phone_no']?.toString() ?? '';
      _doorController.text = _user?['door_no'] ?? '';
      _streetController.text = _user?['street'] ?? '';
      _cityController.text = _user?['city'] ?? '';
      _pincodeController.text = _user?['pincode']?.toString() ?? '';
      _passwordController.text = _user?['password'] ?? ''; // ✅ Reset
    });
  }

  @override
  Widget build(BuildContext context) {
    final beige = const Color(0xFFF9F5EF);
    final warmBrown = const Color(0xFF7B6F61);
    final accent = const Color.fromARGB(255, 241, 124, 163);
    final cardWhite = Colors.white;
    final borderColor = Colors.black12;

    return Scaffold(
      backgroundColor: beige,
      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: accent,
            size: 26.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Image.asset("assets/image/shopiee.png", height: 38.h),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: accent, size: 26.sp),
            onPressed: _logout,
          ),
        ],
      ),
      body: _user == null
          ? Center(child: CircularProgressIndicator(color: warmBrown))
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  children: [
                    SizedBox(height: 18.h),

                    // Avatar + edit icon
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60.r,
                          backgroundImage: const NetworkImage(
                            "https://images.unsplash.com/photo-1580274455191-1c62238fa333?auto=format&fit=crop&q=60&w=500",
                          ),
                          backgroundColor: cardWhite,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() => _isEditing = !_isEditing);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: accent,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: borderColor, blurRadius: 2),
                              ],
                            ),
                            padding: EdgeInsets.all(6.sp),
                            child: Icon(
                              _isEditing
                                  ? Icons.close_rounded
                                  : Icons.edit_rounded,
                              size: 22.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 22.h),

                    // Name
                    _isEditing
                        ? _buildTextField("Name", _nameController)
                        : Text(
                            _user?['name'] ?? 'Loading...',
                            style: GoogleFonts.montserrat(
                              fontSize: 22.sp,
                              color: warmBrown,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                    SizedBox(height: 6.h),

                    // City
                    _isEditing
                        ? _buildTextField("City", _cityController)
                        : Text(
                            _user?['city'] ?? '',
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              color: accent,
                            ),
                          ),

                    SizedBox(height: 10.h),

                    // When editing — show save/cancel buttons

                    // SizedBox(height: 20.h),

                    // User Details
                    Card(
                      color: cardWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      child: Column(
                        children: [
                          _infoOrField("Email", _emailController),
                          Divider(height: 0, color: borderColor),
                          _infoOrField("Phone", _phoneController),
                          Divider(height: 0, color: borderColor),
                          _infoOrField("Door No", _doorController),
                          Divider(height: 0, color: borderColor),
                          _infoOrField("Street", _streetController),
                          Divider(height: 0, color: borderColor),
                          _infoOrField("City", _cityController),
                          Divider(height: 0, color: borderColor),
                          _infoOrField("Pincode", _pincodeController),
                          if (_isEditing) ...[
                            Divider(height: 0, color: borderColor),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              child: _buildTextField(
                                "Password",
                                _passwordController,
                                obscureText: true,
                              ),
                            ),
                          ], // ✅ Password field at bottom
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    if (_isEditing)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ✅ Save Button with Dialog
                          ElevatedButton.icon(
                            onPressed: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "Save Changes",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  content: Text(
                                    "Are you sure you want to save the changes to your profile?",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: Text(
                                        "Cancel",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: Text(
                                        "Save",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.green[700],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );

                              if (confirm == true) {
                                _saveChanges();
                              }
                            },
                            icon: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Save",
                              style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[600],
                              padding: EdgeInsets.symmetric(
                                horizontal: 26.w,
                                vertical: 12.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              elevation: 4,
                              shadowColor: Colors.green.withOpacity(0.3),
                            ),
                          ),

                          SizedBox(width: 12.w),

                          // ❌ Cancel Button
                          ElevatedButton.icon(
                            onPressed: _cancelEditing,
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Cancel",
                              style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[600],
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 12.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              elevation: 4,
                              shadowColor: Colors.red.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
    );
  }

  // Widget _infoOrField(String label, TextEditingController controller,) {
  //   if (_isEditing) {
  //     return Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
  //       child: _buildTextField(label, controller,),
  //     );
  //   } else {
  //     return ListTile(
  //       title: Text(
  //         label,
  //         style: GoogleFonts.montserrat(
  //           fontSize: 15.sp,
  //           color: Colors.black54,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //       trailing: Text(
  //         controller.text,
  //         style: GoogleFonts.montserrat(
  //           fontSize: 15.sp,
  //           color: Colors.black87,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //     );
  //   }
  // }

  Widget _infoOrField(String label, TextEditingController controller) {
    if (_isEditing) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        child: _buildTextField(label, controller),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100.w, // To keep labels aligned
              child: Text(
                label,
                style: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Text(
                controller.text,
                textAlign: TextAlign.right,
                style: GoogleFonts.montserrat(
                  fontSize: 15.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  //   Widget _buildTextField(
  //     String label,
  //     TextEditingController controller, {
  //     bool obscureText = false,
  //   }) {
  //     final borderColor = Colors.black12;
  //     final warmBrown = const Color(0xFF7B6F61);

  //     return TextField(
  //       controller: controller,
  //       obscureText: obscureText,
  //       style: GoogleFonts.montserrat(
  //         fontSize: 15.sp,
  //         color: Colors.black87,
  //         fontWeight: FontWeight.w500,
  //       ),
  //       decoration: InputDecoration(
  //         labelText: label,
  //         labelStyle:
  //             GoogleFonts.montserrat(fontSize: 14.sp, color: Colors.black54),
  //         filled: true,
  //         fillColor: Colors.white,
  //         contentPadding:
  //             EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(12.r),
  //           borderSide: BorderSide(color: borderColor),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(12.r),
  //           borderSide: BorderSide(color: borderColor),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(12.r),
  //           borderSide: BorderSide(color: warmBrown, width: 1.2),
  //         ),
  //       ),
  //     );
  //   }
  // }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool obscureText = false,
  }) {
    final borderColor = Colors.black12;
    final warmBrown = const Color(0xFF7B6F61);

    // Track password visibility
    bool isPasswordField = label.toLowerCase() == "password";
    bool isObscured = obscureText;

    return StatefulBuilder(
      builder: (context, setState) {
        return TextField(
          controller: controller,
          obscureText: isPasswordField ? isObscured : false,
          style: GoogleFonts.montserrat(
            fontSize: 15.sp,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: GoogleFonts.montserrat(
              fontSize: 14.sp,
              color: Colors.black54,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: warmBrown, width: 1.2),
            ),
            // 👁️ Add visibility toggle for password only
            suffixIcon: isPasswordField
                ? IconButton(
                    icon: Icon(
                      isObscured
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: warmBrown,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  )
                : null,
          ),
        );
      },
    );
  }
}
