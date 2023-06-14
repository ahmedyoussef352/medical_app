// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../view/screens/doctor_screens/auth_doctor/sign_up_doctor.dart';
import '../../../../../view/screens/doctor_screens/home_doc/home_layout_doc.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/image.assets.dart';
import '../../../../core/constant/linkapi.dart';
import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../../core/functions/invalid.dart';
import '../../../../data/auth_service/crud.dart';
import '../../../../main.dart';
import '../../../componants/components.dart';
import '../add_info/add_info.dart';

class LoginDoctor extends StatefulWidget {
  const LoginDoctor({super.key});

  @override
  State<LoginDoctor> createState() => _LoginDoctorState();
}

class _LoginDoctorState extends State<LoginDoctor> with Crud {
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          loginDoc() async {
            if (formState.currentState!.validate()) {
              isloading = true;
              var response = await postRequest(linkLoginDoc, {
                "email": email.text,
                "password": password.text,
              });
              isloading = false;

              // ignore: duplicate_ignore
              if (response["status"] == "success") {
                sharedPrefDoc.setString(
                    "id", response['data']['id'].toString());
                sharedPrefDoc.setString(
                    "username", response['data']['username']);
                sharedPrefDoc.setString("email", response['data']['email']);
                sharedPrefDoc.setString("phone", response['data']['phone']);
                sharedPrefDoc.setString(
                    "password", response['data']['password']);
                setState(() async {
                  print(sharedPrefDoc.getString("id"));
                  var x = await cubit.getidDoc(
                      id: sharedPrefDoc.getString("id").toString());
                  setState(() {
                    x == null
                        ? navigatTo(context, const AddInfo())
                        : navigatTo(context, const HomeLayoutDoc());
                  });
                  print("------------------------------------------------");
                  print(x);
                  print("------------------------------------------------");
                  print("------------------------------------------------");
                });
              } else {
                // ignore: avoid_single_cascade_in_expression_statements
                AwesomeDialog(
                    context: context,
                    title: "alert !",
                    body: const Text(
                        "The email or password is incorrect, or the account does not exist."))
                  ..show();
              }
            }
          }

          return Scaffold(
            // appBar: AppBar(),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(signPhoto),
                  fit: BoxFit.cover,
                ),
              ),
              child: isloading == false
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 70.0, left: 20.0, right: 20.0),
                      child: Container(
                        child: SingleChildScrollView(
                          child: Form(
                            key: formState,
                            child: isloading == true
                                ? showLoadingIndicator()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      const Text(
                                        'Sign In',
                                        style: TextStyle(
                                            fontSize: 27,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Don\'t have an account?',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              navigatTo(
                                                  context, const SignUpDoc());
                                            },
                                            child: const Text("Sign Up!",
                                                style: TextStyle(
                                                    color: blue,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      lable(
                                          label: 'Email',
                                          fontWeight: FontWeight.w600),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      defaultFormFieldAuth(
                                        controller: email,
                                        type: TextInputType.emailAddress,
                                        validate: (val) {
                                          return validInput(val!, 8, 22);
                                        },
                                        text: 'Email Address',
                                      ),
                                      //),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      lable(
                                          label: 'Password',
                                          fontWeight: FontWeight.w600),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      defaultFormFieldAuth(
                                        controller: password,
                                        type: TextInputType.visiblePassword,
                                        isPassword: true,
                                        validate: (val) {
                                          return validInput(val!, 8, 16);
                                        },
                                        text: 'Password',
                                      ),
                                      //),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      defaultButton(
                                        onpressed: () async {
                                          await loginDoc();
                                        },
                                        text: 'Sign In',
                                        radius: 18.0,
                                        // isUpperCase: true,
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    )
                  : showLoadingIndicator(),
            ),
          );
        });
  }
}
