// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:medical_app/view/screens/paitent_screens/profile/profile_screen.dart';
import '../../../../main.dart';
import '../../../componants/components.dart';
import '../../../screens/paitent_screens/my_appiontment/appointment_screen.dart';
import '../../../screens/paitent_screens/setting/setting.dart';
import '../../../screens/paitent_screens/welcome/welcome_screen.dart';
import '../../../widgets/menu_item.dart';

class MyBottomSheet extends StatefulWidget {
  bool user ;
   MyBottomSheet({super.key,required this.user});

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return widget.user==true?
        // Scaffold(
        //   body:
        Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        // child: GestureDetector(
        // onTap: () {
        //   Navigator.of(context).pop();
        // },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuItem(
                icon: Icons.calendar_today,
                title: 'My Appointments',
                ontap: () {
                  navigatTo(context,  const MyAppointMent());
                }),
            MenuItem(
                icon: Icons.person,
                title: 'Profile',
                ontap: () {
                  navigatTo(context, const ProfileScreen());
                }),
            MenuItem(
                icon: Icons.settings,
                title: 'Settings',
                ontap: () {
                  navigatTo(context, const SettingsPage());
                }),
            MenuItem(
                icon: Icons.logout_outlined,
                title: 'Log Out',
                ontap: () {
                  sharedPrefUser.clear();
                  navigatTo(context, const WelcomeScreen());
                }),
          ],
        ),
      ),
      //      ),
      //  ),
    ):Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 247, 79, 67),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        // child: GestureDetector(
        // onTap: () {
        //   Navigator.of(context).pop();
        // },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuItem(
              doc: true,
                icon: Icons.calendar_today,
                title: 'My Appointments',
                ontap: () {
                  navigatTo(context,  const MyAppointMent());
                }),
            MenuItem(
              doc: true,
                icon: Icons.person,
                title: 'Profile',
                ontap: () {
                  navigatTo(context, const ProfileScreen());
                }),
            MenuItem(
              doc: true,
                icon: Icons.logout_outlined,
                title: 'Log Out',
                ontap: () {
                  sharedPrefUser.clear();
                  sharedPrefDoc.clear();
                  navigatTo(context, const WelcomeScreen());
                }),
          ],
        ),
      ),
      //      ),
      //  ),
    );
  }
}
