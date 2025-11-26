import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopiee/screens/profile_screen.dart';

import 'about_page.dart';

class SettingsPage extends StatelessWidget {
  final dynamic data;
  const SettingsPage({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final beige = const Color(0xFFF9F5EF);
    final pink = const Color(0xFFE976A6);

    return Scaffold(
      backgroundColor: beige,
      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle("Account"),
              _minimalTile(
                icon: Icons.person_outline,
                title: "Profile",
                onTap: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(username: data["name"])));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        username: data, // <-- THIS IS THE FIX
                      ),
                    ),
                  );
                },
              ),
              _minimalTile(
                icon: Icons.lock_outline,
                title: "Change Password",
                onTap: () {},
              ),

              SizedBox(height: 22.h),
              _sectionTitle("Preferences"),
              _minimalTile(
                icon: Icons.dark_mode_outlined,
                title: "Theme",
                trailing: Switch(value: false, onChanged: (_) {}),
                onTap: () {},
              ),
              _minimalTile(
                icon: Icons.notifications_none,
                title: "Notifications",
                onTap: () {},
              ),

              SizedBox(height: 22.h),
              _sectionTitle("Data"),
              _minimalTile(
                icon: Icons.storage_outlined,
                title: "Local Database",
                onTap: () {},
              ),
              _minimalTile(
                icon: Icons.delete_outline,
                title: "Clear Cache",
                onTap: () {},
              ),

              SizedBox(height: 22.h),
              _sectionTitle("About"),
              _minimalTile(
                icon: Icons.info_outline,
                title: "About Shopiee",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _minimalTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            Icon(icon, size: 22.sp, color: Colors.black87),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            trailing ??
                Icon(Icons.chevron_right, size: 22.sp, color: Colors.black45),
          ],
        ),
      ),
    );
  }
}
