// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously, unnecessary_null_comparison, avoid_print

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
import '../../../../main.dart';
import '../../../componants/components.dart';
class AddInfo extends StatefulWidget {
  const AddInfo({super.key});

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> with Crud {
  // bool isloading = false;
  String category = '';
  File? myfile;
  TextEditingController name = TextEditingController();
  TextEditingController categoryc = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController describtion = TextEditingController();
  TextEditingController paitent = TextEditingController();
  TextEditingController city = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  // late MapLatLng _selectedLocation;

  // void getCurrentLocation() async {
  //   Position position = await Geolocator.getCurrentPosition();
  //   LatLng latLng = LatLng(position.latitude, position.longitude);
  //   _mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 14));
  //   setState(() {
  //     _markers.add(Marker(
  //       markerId: const MarkerId('current_location'),
  //       position: latLng,
  //       infoWindow: const InfoWindow(title: 'My Location'),
  //     ));
  //   });
  // }
  // void print(_mapController){
  //   print(_mapController);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return 
          
          Scaffold(


              // appBar: AppBar(),
              body:
               Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration:  const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(addInformation),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                      // isloading == false
                      // ?
                      Padding(
                    padding: const EdgeInsets.only(
                        top: 70.0, left: 20.0, right: 20.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formstate,
                        child:
                            //isloading == true
                            //?showLoadingIndicator()
                            //:
                            Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Add Information',
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
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
                                                color: grey,
                                              ),
                                              child: const Center(
                                                  child: Text(
                                                '+',
                                                style: TextStyle(
                                                    fontSize: 30,
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
                                              child: const Icon(Icons.verified,
                                                  color: Colors.green,
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
                            const SizedBox(
                              height: 15.0,
                            ),
                            lable(label: 'name', fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 10.0,
                            ),
                            defaultFormFieldAuth(
                              controller: name,
                              type: TextInputType.text,
                              validate: (val) {
                                return validInput(val!, 3, 15);
                              },
                              text: 'please enter your name !',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            lable(
                                label: 'Category', fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 5,
                            ),
                            Wrap(
                              runSpacing: 10,
                              children: [
                                categorySelect('Cardiologist', 0xffff6d6e),
                                const SizedBox(
                                  width: 20,
                                ),
                                categorySelect('Neurosurgeon', 0xfff29732),
                                const SizedBox(
                                  width: 20,
                                ),
                                categorySelect('Pediatrician', 0xff6557ff),
                                const SizedBox(
                                  width: 20,
                                ),
                                categorySelect('Psychiatrist', 0xff234ebd),
                              ],
                            ),
                            //),
                            const SizedBox(
                              height: 20,
                            ),
                            lable(label: 'Years', fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 10.0,
                            ),
                            defaultFormFieldAuth(
                              controller: year,
                              type: TextInputType.number,
                              validate: (val) {
                                return validInput(val!, 0, 3);
                              },
                              text:
                                  'please enter your nubmer of year experience !',
                            ),
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            lable(
                                label: 'Description',
                                fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 10.0,
                            ),
                            defaultFormFieldAuth(
                              controller: describtion,
                              type: TextInputType.text,
                              validate: (val) {
                                return validInput(
                                  val!,
                                  8,
                                  200,
                                );
                              },
                              text: 'please enter about Description !',
                            ),
                            //),
                            const SizedBox(
                              height: 30.0,
                            ),
                            lable(
                                label: 'Patients', fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 10.0,
                            ),
                            defaultFormFieldAuth(
                              controller: paitent,
                              type: TextInputType.number,
                              validate: (val) {
                                return validInput(val!, 0, 5);
                              },
                              text:
                                  'please enter the number of Patients you have previously treated  !',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            lable(label: 'city', fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 10.0,
                            ),
                            defaultFormFieldAuth(
                              controller: city,
                              type: TextInputType.text,
                              validate: (val) {
                                return validInput(val!, 0, 11);
                              },
                              text: 'please enter your city !',
                            ),
                            // MaterialButton(
                            //   child: const Text('Submit'),
                            //   onPressed: _submitForm,
                            // ),
                            const SizedBox(
                              height: 20.0,
                            ),

                            defaultButton(
                              onpressed: () async {
                                cubit.addInfo(context,
                                    formstate: formstate,
                                    // id: sharedPrefDoc.getString("id"),
                                    name: name,
                                    category: category,
                                    year: year,
                                    describtion: describtion,
                                    paitent: paitent,
                                    myfile: myfile,
                                    city: city);
                                print(sharedPrefDoc.get("id"));
                                // sharedPrefDoc.setString("name", response['data']['name']);
                              },
                              text: 'Add',
                              radius: 18.0,
                              // isUpperCase: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  // : showLoadingIndicator()
                  ));
        });
  }

  Widget categorySelect(String label, int color) {
    return InkWell(
      onTap: () {
        setState(() {
          category = label;
        });
      },
      child: Chip(
        backgroundColor: category == label ? Colors.white : Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(label),
        labelStyle: TextStyle(
            color: category == label ? Colors.black : Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600),
        labelPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 3.8),
      ),
    );
  }
}
