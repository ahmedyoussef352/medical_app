// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medical_app/view/componants/components.dart';
import 'package:medical_app/view/screens/paitent_screens/my_appiontment/past.dart/past_screen.dart';
import 'package:medical_app/view/screens/paitent_screens/my_appiontment/upcoming/upcaming.dart';

import '../home/home_layout.dart';

class MyAppointMent extends StatefulWidget {
  const MyAppointMent({super.key});

  @override
  State<MyAppointMent> createState() => _MyAppointMentState();
}

class _MyAppointMentState extends State<MyAppointMent> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              navigatTo(context, const HomeLayout());
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'My Appointment',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          bottom: const TabBar(
            indicatorWeight: 3.0,
            labelColor: Colors.black,
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Upcomming',
              ),
              Tab(
                text: 'Past',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UpcommingScreen(),
            Past(),
          ],
        ),
      ),
    );
  }
}
