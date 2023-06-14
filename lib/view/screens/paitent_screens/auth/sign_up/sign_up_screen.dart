// ignore_for_file: avoid_unnecessary_containers, must_be_immutable, use_build_context_synchronously, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/image.assets.dart';
import '../../../../../core/cubit/home_layout/cubit.dart';
import '../../../../../core/cubit/home_layout/states.dart';
import '../../../../../core/functions/invalid.dart';
import '../../../../../data/auth_service/crud.dart';
import '../../../../componants/components.dart';
import '../login/login_screen.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Crud {
  bool isloading = false;
  // Future? signUp() async {
  //   var formdata = formstate.currentState;
  //   if (formdata!.validate()) {
  //     if (password.text == confirmPassword.text) {
  //       isloading = true;
  //       setState(() {});
  //       var response = await postRequest(linkSignUp, {
  //         "username": username.text,
  //         "email": email.text,
  //         "phone": phone.text,
  //         "password": password.text,
  //       });
  //       isloading = false;
  //       setState(() {});
  //       if (response["status"] == "success") {
  //         navigatTo(context, const LoginScreen());
  //       } else {
  //         print('signUp fail');
  //       }
  //     } else {
  //       return Fluttertoast.showToast(
  //           msg: "Your Passwordrs aren't identical",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.grey[600],
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     }
  //   }
  // }

  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
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
                          child: SingleChildScrollView(
                            child: Form(
                              key: formstate,
                              child: isloading == true
                                  ? showLoadingIndicator()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        const Text(
                                          'Create Accoun',
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
                                              'Already have an account?',
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
                                                navigatTo(context,
                                                    const LoginScreen());
                                              },
                                              child: const Text("Sign In!",
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
                                            label: 'Username',
                                            fontWeight: FontWeight.w600),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        defaultFormFieldAuth(
                                          controller: username,
                                          type: TextInputType.emailAddress,
                                          validate: (val) {
                                            return validInput(val!, 6, 15);
                                          },
                                          text: 'please enter your Username !',
                                        ),
                                        //),
                                        const SizedBox(
                                          height: 20,
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
                                          text: 'please enter your Email !',
                                        ),
                                        // ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        lable(
                                            label: 'Phone',
                                            fontWeight: FontWeight.w600),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        defaultFormFieldAuth(
                                          controller: phone,
                                          type: TextInputType.number,
                                          validate: (val) {
                                            return validInput(
                                              val!,
                                              11,
                                              11,
                                            );
                                          },
                                          text: 'please enter your Phone !',
                                        ),
                                        //),
                                        const SizedBox(
                                          height: 30.0,
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
                                          text: 'please enter your Password !',
                                        ),
                                        //),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        lable(
                                            label: 'Confirm password',
                                            fontWeight: FontWeight.w600),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        defaultFormFieldAuth(
                                          controller: confirmPassword,
                                          type: TextInputType.visiblePassword,
                                          isPassword: true,
                                          validate: (val) {
                                            return validInput(val!, 8, 16);
                                          },
                                          text:
                                              'please enter your Password again !',
                                        ),
                                        // ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        defaultButton(
                                          onpressed: () async {
                                            await cubit.signUp(context,
                                            user: true,
                                                email: email,
                                                username: username,
                                                phone: phone,
                                                password: password,
                                                confirmPassword:
                                                    confirmPassword,
                                                formstate: formstate);
                                          },
                                          text: 'Sign Up',
                                          radius: 18.0,
                                          // isUpperCase: true,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        )
                      : showLoadingIndicator()));
        });
  }
}
