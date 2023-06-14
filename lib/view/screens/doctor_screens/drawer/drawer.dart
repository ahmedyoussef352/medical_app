// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';
import '../../../../main.dart';
import '../../../componants/components.dart';
import '../../paitent_screens/welcome/welcome_screen.dart';
import '../appoint_ment/appoint_ment_screen.dart';
import '../chat_screen/profiles_user_chat.dart';
import '../my_rating/rating_doc.dart';
import '../profile/profile.dart';

class DrawerSide extends StatefulWidget {
  const DrawerSide({super.key});

  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  @override
  Widget build(BuildContext context) {
    // var userData = widget.userprovider.currentUserData;

    return Drawer(
      child: Container(
          color: decolor,
          child: ListView(children: [
            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                listTile(
                  iconData: Icons.calendar_today,
                  title: "My Appointments",
                  onTap: () {
                    navigatTo(context, const MyAppointMentDoc());
                  },
                ),
                listTile(
                  iconData: Icons.person_outlined,
                  title: "My Profile",
                  onTap: () {
                    navigatTo(context, const ProfileScreenDoc());
                  },
                ),
                listTile(
                    iconData: Icons.star_outline,
                    title: "Rating & Review",
                    onTap: () {
                      navigatTo(context, const RatingDoc());
                    }),
                listTile(
                    iconData: Icons.favorite_outline,
                    title: "chats",
                    onTap: () {
                      navigatTo(context, const ChatsProfiles());                    }),
                listTile(
                    iconData: Icons.exit_to_app_outlined,
                    title: "Log out",
                    onTap: () {
                      sharedPrefDoc.clear();
                      navigatTo(context, const WelcomeScreen());
                    }),
              ],
            ),
          ])),
    );
  }
}
