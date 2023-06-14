// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../../../view/componants/components.dart';
import '../../../../../view/screens/doctor_screens/appoint_ment/past/past_doc.dart';
import '../../../../../view/screens/doctor_screens/appoint_ment/upcomming/upcomming.dart';
import '../../../../../view/screens/doctor_screens/home_doc/home_layout_doc.dart';

class MyAppointMentDoc extends StatefulWidget {
  const MyAppointMentDoc({super.key});

  @override
  State<MyAppointMentDoc> createState() => _MyAppointMentDocState();
}

class _MyAppointMentDocState extends State<MyAppointMentDoc> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              navigatTo(context, const HomeLayoutDoc());
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
            UpcommingScreenDoc(),
            PastDoc(),
          ],
        ),
      ),
    );
  }
}
