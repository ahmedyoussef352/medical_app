// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../../core/constant/image.assets.dart';
import '../../../core/constant/linkapi.dart';
import '../../../data/model/profile_model.dart';
import '../../componants/components.dart';
import '../../screens/paitent_screens/home/home_layout.dart';

class ProfileItem extends StatefulWidget {
   final ProfileModel pofileModel;
   dynamic edit;

   ProfileItem({
    Key? key,
    required this.pofileModel,
    required this.edit,
  }) : super(key: key);

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                // Expanded(
                //child:
                Expanded(
                  child: Container(
                    width: double.infinity,
                    // height: 150,
                    child: Image.asset(
                      coverProfile,
                    ),
                  ),
                ),
                // ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                navigatTo(context, const HomeLayout());
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          const Text('Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              )),
                          InkWell(
                              onTap: widget.edit,
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  Text('Edit',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 42),
                        child: Column(
                          children:   [
                            CircleAvatar(
                              radius: 68,
                              backgroundColor: const Color(0x1AFFFFFF),
                              backgroundImage: NetworkImage('$linkImageRootprofile/${widget.pofileModel.image}'),
                              // 
    
                              // child: Expanded(
                              //   child:
                              // )
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                lable(label: "Name"),
                const SizedBox(
                  height: 10,
                ),
                textformField(context, text: "${widget.pofileModel.name}"),
                //
                const SizedBox(
                  height: 25,
                ),
                lable(label: 'Email'),
                const SizedBox(
                  height: 10,
                ),
                textformField(context, text: "${widget.pofileModel.email}"),
                //  
                const SizedBox(
                  height: 25,
                ),
                lable(label: 'Phone'),
                const SizedBox(
                  height: 10,
                ),
                textformField(context, text: '${widget.pofileModel.phone}'),
                //""
                const SizedBox(
                  height: 25,
                ),
                lable(label: 'Address'),
                const SizedBox(
                  height: 12,
                ),
                textformField(
                  context,
                  text: "${widget.pofileModel.address}",
                ),
                //
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      )
    ;
  }
}