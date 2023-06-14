// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../componants/components.dart';
import '../area/area_screen.dart';
import '../home/home_layout.dart';

class SearchScreen extends StatelessWidget {
  var categoryController = TextEditingController();
  var areaController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  navigatTo(context, const HomeLayout());
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
              title: const Padding(
                padding: EdgeInsetsDirectional.only(start: 55.0),
                child: Text(
                  'Search Here',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formstate,
                child: Column(
                  children: [
                    Container(
                      color: pageColor,
                      //Color.fromARGB(255, 231, 239, 250),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 30.0, right: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20.0),
                            const Text(
                              'Search your',
                              style: TextStyle(fontSize: 20),
                            ),
                            const Text(
                              'Specialist',
                              style: TextStyle(
                                  fontSize: 28.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            custimFormFieldSearch(
                              controller: areaController,
                              type: TextInputType.streetAddress,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your the Area';
                                }
                              },
                              text: 'Select Area',
                              icon: Icons.add_location_alt_outlined,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            custimFormFieldSearch(
                              controller: categoryController,
                              type: TextInputType.name,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your doctor name';
                                }
                              },
                              text: 'Specialist',
                              icon: Icons.person,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            defaultButton(
                              background: blue,
                              radius: 8.0,
                              onpressed: () async {
                                if (formstate.currentState!.validate()) {
                                  navigatTo(
                                      context,
                                      SelectedArea(
                                        category: categoryController.text,
                                        city: areaController.text,
                                      ));
                                }
                              },
                              text: 'Search',
                              isUpperCase: false,
                            ),
                            const SizedBox(
                              height: 120.0,
                            )
                          ],
                        ),
                      ),
                    ),
                    const AnimatedOpacity(
                      opacity: 0.7,
                      duration: Duration(),
                      child: Image(
                        image: AssetImage('assets/images/search.jpg'),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
