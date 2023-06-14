// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';
import '../../../componants/components.dart';
import '../../../modules/home_layout/more/menu.dart';
import '../../../widgets/setting_item.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final bool _notificationsEnabled = true;
  final bool _messagesEnabled = true;
  final bool _callsEnabled = true;
  final bool _videoCallsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      // appBar: AppBar(
      //   title: const Text('Settings'),
      //   backgroundColor: pageColor,
      // ),
      body: Column(
        children: [
          appBar('Settings', context),
          const SizedBox(
            height: 10,
          ),
          ItemSetting(
            colorData: const Color.fromARGB(255, 100, 184, 254),
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            value: _notificationsEnabled,
          ),
          const SizedBox(
            height: 2,
          ),
          ItemSetting(
            colorData: const Color.fromARGB(255, 187, 150, 193),
            icon: Icons.message_outlined,
            title: 'Messages Options',
            value: _messagesEnabled,
          ),
          const SizedBox(
            height: 2,
          ),
          ItemSetting(
            colorData: Colors.red.shade100,
            icon: Icons.call,
            title: 'Calls Options',
            value: _callsEnabled,
          ),
          const SizedBox(
            height: 2,
          ),
          ItemSetting(
            colorData: Colors.purple.shade100,
            icon: Icons.video_call,
            title: 'Video Calls Option',
            value: _videoCallsEnabled,
          ),
          const SizedBox(
            height: 2,
          ),
          // MaterialButton(
          //   onPressed: () {
          //     showMyBottomSheet(context);
          //   },
          //   child: const Text('gsdjfgudsjkfgh'),
          //   color: Colors.red,
          // )
        ],
      ),
    );
  }
}

showMyBottomSheet(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return  MyBottomSheet(user: true,);
    },
  );
}
