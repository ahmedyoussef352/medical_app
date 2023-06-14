// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../../../view/modules/profile/rating_screen_user.dart';
import '../../../core/class/call.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/linkapi.dart';
import '../../componants/components.dart';
import '../../screens/paitent_screens/appointment/appointment.dart';
import '../../screens/paitent_screens/call/call.dart';
import '../../screens/paitent_screens/call/voice.dart';
import '../../screens/paitent_screens/chat/chat_user.dart';

class Profiledoc extends StatefulWidget {
  final dynamic data;
  //  void Function()? chat;
   const Profiledoc({Key? key, required this.data,
    //this.chat
    }) : super(key: key);

  @override
  State<Profiledoc> createState() => _ProfiledocState();
}

class _ProfiledocState extends State<Profiledoc> {
  final callIdController = TextEditingController(text: "call_id");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              'Dr. ${widget.data['doc_name']}',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image(
                image: NetworkImage('$linkImageRoot/${widget.data['doc_img']}'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 105.0,
                        height: 40.0,
                        // ignore: sort_child_properties_last
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VoiceCall(
                                        callID: callIdController.text)));
                          },
                          child: Container(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'voice call',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.cyan[200],
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 105.0,
                        height: 40.0,
                        // ignore: sort_child_properties_last
                        child: MaterialButton(
                          onPressed: () {
                            MyConst.userId = '${widget.data['doc_id']}';
                            MyConst.userName = '${widget.data['doc_name']}';
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MyCall(callID: callIdController.text)));
                          },
                          child: Container(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.videocam_outlined,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'video call',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.purple[200],
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 105.0,
                        height: 40.0,
                        // ignore: sort_child_properties_last
                        child: MaterialButton(
                          onPressed: (){
                            navigatTo(context, ChatScreenUser(data: widget.data,));
                            
                          },
                          // widget.chat!,
                          child: Container(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.message,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'Message',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.deepOrange[200],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 10.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.data['doc_cat']} Specialist',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Text(
                          'Good Health Clinic,MBBS,FCPS',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13.0),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: defaultButton(text: 'his rating', onpressed: (){
                          navigatTo(context, RatingScreenUser(id: '${widget.data['doc_id']}',));
                        },),
                      ),
                      Row(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 25.0,
                              ),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 25.0,
                              ),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 25.0,
                              ),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 25.0,
                              ),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 25.0,
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 10.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About ${widget.data['doc_name']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${widget.data['doc_des']}',
                          style:
                              const TextStyle(fontSize: 13.0, wordSpacing: 5),
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Patients',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 13.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${widget.data['doc_paitent']}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 18.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 80.0,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Experience',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 13.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${widget.data['doc_year']} Years',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 18.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 80.0,
                      ),
                      Column(
                        children: const [
                          Text(
                            'Review',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 13.0),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2.05K',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                defaultButton(
                  text: 'Book an Appointment',
                  radius: 10,
                  onpressed: () {
                    setState(
                      () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Appointment('${widget.data['doc_name']}')));
                        navigatTo(
                            context,
                            Appointment(
                              data: widget.data,
                            ));
                      },
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
