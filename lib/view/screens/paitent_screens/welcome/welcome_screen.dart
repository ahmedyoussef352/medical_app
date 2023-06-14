import 'package:flutter/material.dart';
import 'package:medical_app/view/screens/doctor_screens/home_doc/home_layout_doc.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/image.assets.dart';
import '../../../../../../main.dart';
import '../../../componants/components.dart';
import '../auth/sign_up/sign_up_screen.dart';
import '../../doctor_screens/auth_doctor/sign_up_doctor.dart';
import '../home/home_layout.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(welcomephoto),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 300,
                    ),
                    const Text(
                      'DOC Spot',
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontStyle: FontStyle.normal),
                    ),
                    const SizedBox(
                      height: 180,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: defaultButton(
                            background: signIn,
                            onpressed: () {
                              sharedPrefUser.getString("id") == null
                                  ? navigatTo(context, const SignUpScreen())
                                  : navigatTo(context, const HomeLayout());
                            },
                            text: 'Paitent',
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: const Border(
                                    bottom: BorderSide(color: signIn),
                                    left: BorderSide(color: signIn),
                                    right: BorderSide(color: signIn),
                                    top: BorderSide(color: signIn))),
                            child: defaultButton(
                              background: Colors.transparent,
                              onpressed: () {
                                sharedPrefDoc.getString("id") == null
                                    ? navigatTo(context, const SignUpDoc())
                                    : navigatTo(context, const HomeLayoutDoc());
                              },
                              text: 'Doctor',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
