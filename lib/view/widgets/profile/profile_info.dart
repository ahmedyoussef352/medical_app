// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../../../core/constant/linkapi.dart';
import '../../../data/model/profile_model.dart';
import '../../../core/constant/image.assets.dart';
import '../../componants/components.dart';
import '../../screens/paitent_screens/home/home_layout.dart';

class ProfileInfo extends StatefulWidget {
  final ProfileModel pofileModel;

   const ProfileInfo({Key? key, required this.pofileModel,}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
          child: ListView(
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
                                  onTap: () {},
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
                              children:  [
                                CircleAvatar(
                                  radius: 68,
                                  backgroundColor: const Color(0x1AFFFFFF),
                                  backgroundImage: NetworkImage('$linkImageRootprofile/${widget.pofileModel.image}'),
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
                    textformField(context,text:"${widget.pofileModel.name}"),
                    const SizedBox(
                      height: 25,
                    ),
                    lable(label: 'Email'),
                    const SizedBox(
                      height: 10,
                    ),
                    textformField(context,text:"${widget.pofileModel.email}"),
                    const SizedBox(
                      height: 25,
                    ),
                    lable(label: 'Phone'),
                    const SizedBox(
                      height: 10,
                    ),
                    textformField(context,text:"${widget.pofileModel.phone}"),
                    const SizedBox(
                      height: 25,
                    ),
                    lable(label:'Address'),
                    const SizedBox(
                      height: 12,
                    ),
                    textformField(context,text: "${widget.pofileModel.address}",),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
    
  }
}


// return BlocConsumer<AppCubit, AppStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           var cubit = AppCubit.get(context);
//     return Scaffold(
//         backgroundColor: pageColor,
//         body: SafeArea(
//           child: ListView(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 250,
//                   child: Stack(
//                     children: [
//                       // Expanded(
//                       //child:
//                       Expanded(
//                         child: Container(
//                           width: double.infinity,
//                           // height: 150,
//                           child: Image.asset(
//                             coverProfile,
//                           ),
//                         ),
//                       ),
//                       // ),
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 IconButton(
//                                     onPressed: () {
//                                       navigatTo(context, const HomeLayout());
//                                     },
//                                     icon: const Icon(
//                                       Icons.arrow_back,
//                                       color: Colors.white,
//                                     )),
//                                 const Text('Profile',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.w600,
//                                     )),
//                                 InkWell(
//                                     onTap: () {},
//                                     child: Row(
//                                       children: const [
//                                         Icon(
//                                           Icons.edit,
//                                           color: Colors.white,
//                                         ),
//                                         Text('Edit',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                             )),
//                                       ],
//                                     )),
//                               ],
//                             ),
//                           ),
//                           Container(
//                               margin: const EdgeInsets.only(top: 42),
//                               child: Column(
//                                 children: const [
//                                   CircleAvatar(
//                                     radius: 68,
//                                     backgroundColor: Colors.white10,
//                                     backgroundImage: AssetImage(mainProfile),
//                                     // child: Expanded(
//                                     //   child:
//                                     // )
//                                   ),
//                                 ],
//                               )),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     lable(label: 'Name'),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     textformField(context),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     lable(label: 'Email'),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     textformField(context),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     lable(label: 'Mobile Number'),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     textformField(context),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     lable(label: 'Adress'),
//                     const SizedBox(
//                       height: 12,
//                     ),
//                     textformField(context),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// );