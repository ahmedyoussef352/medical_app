import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';
import '../../componants/components.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsetsDirectional.only(start: 105.0),
          child: Text(
            'Notifications',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        color: pageColor,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 10.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                     padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 15,vertical: 10
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        const Text(
                          'Today',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                        const SizedBox(height: 20,),
                        notificationItem(
                          title: 'Remind For Serial',
                          content:
                              'it is a long established fact that a read and will be distracted lisece.',
                          time: '11 min',
                        ),
                        notificationItem(
                          title: 'Remind For Serial',
                          content:
                              'it is a long established fact that a read and will be distracted lisece.',
                          time: '11 min',
                        ),
                        notificationItem(
                          title: 'Remind For Serial',
                          content:
                              'it is a long established fact that a read and will be distracted lisece.',
                          time: '11 min',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 20.0,
                          top: 30.0,
                          bottom: 20.0,
                        ),
                        child: Text(
                          'Yesterday',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                      ),
                      notificationItem(
                        title: 'Remind For Serial',
                        content:
                            'it is a long established fact that a read and will be distracted lisece.',
                        time: '11 min',
                      ),
                      notificationItem(
                        title: 'Remind For Serial',
                        content:
                            'it is a long established fact that a read and will be distracted lisece.',
                        time: '11 min',
                      ),
                      notificationItem(
                        title: 'Remind For Serial',
                        content:
                            'it is a long established fact that a read and will be distracted lisece.',
                        time: '11 min',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
