// ignore_for_file: annotate_overrides, sized_box_for_whitespace, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/image.assets.dart';
import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../../core/functions/invalid.dart';
import '../../../../data/auth_service/crud.dart';
import '../../../componants/components.dart';

class EditProfile extends StatefulWidget {
  final dynamic profile;
  const EditProfile({super.key, required this.profile});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> with Crud {
  // editProfile() async {
  //   if (formstate.currentState!.validate()) {
  //     // isloading = true;

  //     var response = await postRequestWithFile(
  //         linkEditPrdofle,
  //         {
  //           "name": name.text,
  //           "email": email.text,
  //           "phone": phone.text,
  //           "address": address.text,
  //           "id":widget.profile['id'].toString()
  //         },
  //         myfile!);
  //     // isloading = false;
  //     if (response["status"] == "success") {
  //       print('---------------------------------');
  //       //  sharedPrefInfo.setString("id", sharedPrefDoc.getString("id").toString());
  //       // t = '${sharedPrefUser.getString("id").toString()}+1';
  //       navigatTo(context, const ProfileScreen());
  //     } else {
  //       print(
  //           '******************************************************************');
  //       print('signUp fail');
  //     }
  //   }
  // }

  File? myfile;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  void initState() {
    name.text = widget.profile['name'].toString();
    email.text = widget.profile['email'].toString();
    phone.text = widget.profile['phone'].toString();
    address.text = widget.profile['address'].toString();
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
              child: Form(
                key: formstate,
                child: Column(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        )),
                                    const Text('Edit Profile',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    InkWell(
                                        onTap: () async {
                                          setState(() async{
                                            // await editProfile();
                                            await cubit.editProfile(context,
                                              formstate: formstate,
                                              name: name,
                                              email: email,
                                              phone: phone,
                                              address: address,
                                              myfile: myfile!,
                                              id: widget.profile['id'], file: widget.profile['image']);
                                          });
                                          
                                          
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.save_as_outlined,
                                              color: Colors.white,
                                            ),
                                            Text('Save',
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
                                    children: [
                                      // CircleAvatar(
                                      //   radius: 68,
                                      //   backgroundColor: Color(0x1AFFFFFF),
                                      //   backgroundImage: NetworkImage(
                                      //       '$linkImageRootprofile/${widget.pofileModel.image}'),
                                      //   //

                                      //   // child: Expanded(
                                      //   //   child:
                                      //   // )
                                      // ),
                                      InkWell(
                                        onTap: () async {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (contxet) => Container(
                                                    height: 150,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 5),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          const Text(
                                                            "Please Choose Image",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: decolor,
                                                            ),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                XFile? xfile =
                                                                    await ImagePicker()
                                                                        .pickImage(
                                                                            source:
                                                                                ImageSource.gallery);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                myfile = File(
                                                                    xfile!
                                                                        .path);
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: double
                                                                    .infinity,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                child:
                                                                    const Text(
                                                                  "From Gallery",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color:
                                                                          white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const Divider(),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: ercolor,
                                                            ),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                XFile? xfile =
                                                                    await ImagePicker()
                                                                        .pickImage(
                                                                            source:
                                                                                ImageSource.camera);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                myfile = File(
                                                                    xfile!
                                                                        .path);
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: double
                                                                    .infinity,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                child:
                                                                    const Text(
                                                                  "From Camera",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color:
                                                                          white),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                        },
                                        child: Container(
                                          height: 130,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: decolor,
                                              width: 1,
                                            ),
                                          ),
                                          child: myfile == null
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons.add,
                                                      size: 32,
                                                      color: decolor,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "Add photo",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          color: decolor),
                                                    )
                                                  ],
                                                )
                                              : Container(
                                                  height: 120,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            70),
                                                  ),
                                                  child: const Icon(
                                                      Icons.verified,
                                                      color: decolor,
                                                      size: 120)),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 20),
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
                          textformFieldedit(context,
                              text: name.text,
                              mycontroller: name, valid: (val) {
                            return validInput(val, 4, 20);
                          }),
                          //
                          const SizedBox(
                            height: 25,
                          ),
                          lable(label: 'Email'),
                          const SizedBox(
                            height: 10,
                          ),
                          textformFieldedit(context,
                              text: email.text,
                              mycontroller: email, valid: (val) {
                            return validInput(val, 4, 20);
                          }),
                          //
                          const SizedBox(
                            height: 25,
                          ),
                          lable(label: 'Phone'),
                          const SizedBox(
                            height: 10,
                          ),
                          textformFieldedit(context,
                              text: phone.text,
                              mycontroller: phone, valid: (val) {
                            return validInput(val, 11, 11);
                          }),
                          //""
                          const SizedBox(
                            height: 25,
                          ),
                          lable(label: 'Address'),
                          const SizedBox(
                            height: 12,
                          ),
                          textformFieldedit(context,
                              text: address.text,
                              mycontroller: address, valid: (val) {
                            return validInput(val, 8, 50);
                          }),
                          //
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
          );
        });
  }
}
