// ignore_for_file: use_build_context_synchronously, sized_box_for_whitespace

import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../../core/functions/invalid.dart';
import '../../../componants/components.dart';

class CreatePost2 extends StatefulWidget {
  // PostModel post;
  const CreatePost2({
    super.key,
    //  required this.post
  });

  @override
  State<CreatePost2> createState() => _CreatePost2State();
}

class _CreatePost2State extends State<CreatePost2> {
  File? myfile;

  TextEditingController content = TextEditingController();
  TextEditingController timecontroller = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return SafeArea(
              top: true,
              bottom: true,
              right: true,
              left: true,
              child: Scaffold(
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formstate,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 12,
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  )),
                              const Spacer(),
                              const Text(
                                'Create New Post',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const Spacer(),
                              const SizedBox(width: 30)
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () async {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (contxet) => Container(
                                        height: 150,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
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
                                                      BorderRadius.circular(10),
                                                  color: decolor,
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    XFile? xfile =
                                                        await ImagePicker()
                                                            .pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery);
                                                    Navigator.of(context).pop();
                                                    myfile = File(xfile!.path);
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: double.infinity,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
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
                                                      BorderRadius.circular(10),
                                                  color: ercolor,
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    XFile? xfile =
                                                        await ImagePicker()
                                                            .pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .camera);
                                                    Navigator.of(context).pop();
                                                    myfile = File(xfile!.path);
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: double.infinity,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
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
                            child: Container(
                              height: 130,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
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
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: decolor),
                                        )
                                      ],
                                    )
                                  : Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(70),
                                      ),
                                      child: const Icon(Icons.verified,
                                          color: decolor, size: 120)),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormFieldAuth(
                            controller: content,
                            type: TextInputType.text,
                            validate: (val) {
                              return validInput(val!, 1, 1000);
                            },
                            text: 'Caption',
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          ConditionalBuilder(
                            condition: true,
                            builder: (BuildContext context) {
                              return defaultButton(
                                radius: 30,
                                width: 100,
                                onpressed: () async {
                                  await cubit.addPost(
                                    context,
                                    formstate: formstate,
                                    content: content,
                                    myfile: myfile,
                                  );
                                },
                                text: "Post",
                              );
                            },
                            fallback: (BuildContext context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}
