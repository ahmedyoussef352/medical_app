// ignore_for_file: library_private_types_in_public_api, override_on_non_overriding_member, sized_box_for_whitespace, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:medical_app/core/constant/colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/class/animation/my_behavior.dart';
import '../../../../core/class/animation/my_painter.dart';
import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../../core/functions/invalid.dart';
import '../../../widgets/profile_component.dart';
import '../../../widgets/profile/profile_components.dart/button.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  File? myfile;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(const Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: white,
            body: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: size.height,
                  child: Stack(
                    children: [
                      Positioned(
                        top: size.height * (animation2.value + .58),
                        left: size.width * .21,
                        child: CustomPaint(
                          painter: MyPainter(50),
                        ),
                      ),
                      Positioned(
                        top: size.height * .98,
                        left: size.width * .1,
                        child: CustomPaint(
                          painter: MyPainter(animation4.value - 30),
                        ),
                      ),
                      Positioned(
                        top: size.height * .5,
                        left: size.width * (animation2.value + .8),
                        child: CustomPaint(
                          painter: MyPainter(30),
                        ),
                      ),
                      Positioned(
                        top: size.height * animation3.value,
                        left: size.width * (animation1.value + .1),
                        child: CustomPaint(
                          painter: MyPainter(60),
                        ),
                      ),
                      Positioned(
                        top: size.height * .1,
                        left: size.width * .8,
                        child: CustomPaint(
                          painter: MyPainter(animation4.value),
                        ),
                      ),
                      Form(
                        key: formstate,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(top: size.height * .1),
                                child: Text(
                                  'Information',
                                  style: TextStyle(
                                    color: black.withOpacity(.7),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    wordSpacing: 4,
                                  ),
                                ),
                              ),
                            ),
                            MaterialButton(
                                onPressed: () async {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (contxet) => Container(
                                            height: 150,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: decolor,
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        XFile? xfile =
                                                            await ImagePicker()
                                                                .pickImage(
                                                                    source: ImageSource
                                                                        .gallery);
                                                        Navigator.of(context)
                                                            .pop();
                                                        myfile =
                                                            File(xfile!.path);
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: const Text(
                                                          "From Gallery",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: ercolor,
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        XFile? xfile =
                                                            await ImagePicker()
                                                                .pickImage(
                                                                    source: ImageSource
                                                                        .camera);
                                                        Navigator.of(context)
                                                            .pop();
                                                        myfile =
                                                            File(xfile!.path);
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: const Text(
                                                          "From Camera",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: white),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ));
                                },
                                child: Center(
                                  child: Column(
                                    children: [
                                      myfile == null
                                          ? Container(
                                              height: 120,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(70),
                                                color: white.withOpacity(.05),
                                              ),
                                              child: const Center(
                                                  child: Text(
                                                '+',
                                                style: TextStyle(
                                                    fontSize: 50,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                            )
                                          : Container(
                                              height: 120,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(70),
                                              ),
                                              child: const Icon(
                                                  Icons.verified_outlined,
                                                  color: decolor,
                                                  size: 120)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Add Photo',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                )),
                            Expanded(
                              flex: 7,
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ProfileFormField(
                                      icon: Icons.account_circle_outlined,
                                      hintText: 'User name...',
                                      mycontroller: name,
                                      type: TextInputType.text,
                                      validate: (val) {
                                        return validInput(val!, 5, 11);
                                      },
                                    ),
                                    ProfileFormField(
                                      icon: Icons.email_outlined,
                                      hintText: 'email ...',
                                      type: TextInputType.emailAddress,
                                      validate: (val) {
                                        return validInput(val!, 9, 18);
                                      },
                                      mycontroller: email,
                                    ),
                                    ProfileFormField(
                                      icon: Icons.phone_outlined,
                                      hintText: 'phone ...',
                                      type: TextInputType.phone,
                                      validate: (val) {
                                        return validInput(
                                          val!,
                                          11,
                                          11,
                                        );
                                      },
                                      mycontroller: phone,
                                    ),
                                    ProfileFormField(
                                      icon: Icons.location_city_outlined,
                                      hintText: 'label ...',
                                      type: TextInputType.text,
                                      validate: (val) {
                                        return validInput(val!, 5, 100);
                                      },
                                      mycontroller: address,
                                    ),
                                    const Expanded(
                                        child: SizedBox(
                                      height: 100,
                                    )),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ButtonProfile(
                                          string: 'add information',
                                          width: 1.5,
                                          voidCallback: () async {
                                            HapticFeedback.lightImpact();
                                            cubit.addProfile(context,
                                                formstate: formstate,
                                                myfile: myfile,
                                                name: name,
                                                email: email,
                                                phone: phone,
                                                address: address);
                                          },
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Expanded(
                            //   flex: 6,
                            //   child:
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
