// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../view/screens/doctor_screens/appoint_ment/appoint_ment_screen.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/linkapi.dart';
import '../../../../../core/cubit/home_layout/cubit.dart';
import '../../../../../core/cubit/home_layout/states.dart';
import '../../../../../data/auth_service/crud.dart';
import '../../../../../data/model/appoint_model.dart';
import '../../../../componants/components.dart';
import '../../../../widgets/appointment_card_doc.dart';

class UpcommingScreenDoc extends StatefulWidget {
  const UpcommingScreenDoc({super.key});

  @override
  State<UpcommingScreenDoc> createState() => _UpcommingScreenDocState();
}

class _UpcommingScreenDocState extends State<UpcommingScreenDoc> with Crud {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: pageColor,
            body: Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  FutureBuilder(
                      future: cubit.getUpcommingDoc(),
                      builder: (BuildContext contnext, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data['status'] == "failed") {
                            return const Center(
                                child: Text(
                              'No Appointments',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ));
                          }
                          return Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data['data']!.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return AppointCartDoc(
                                    delete: () {},
                                    date: false,
                                    appointmentmodel: AppointmentModel.fromJson(
                                        snapshot.data['data'][i]),
                                    cancel: () async {
                                      var response = await postRequest(
                                          linkDeleteAppointment, {
                                        "id": snapshot.data['data'][i]['id']
                                            .toString(),
                                      });

                                      if (response['status'] == "success") {
                                        navigatTo(
                                            context, const MyAppointMentDoc());
                                      }
                                    },
                                  );
                                }),
                          );
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          return const Center(
                            child: Text("loading ..."),
                          );
                        }
                        return const Center(
                          child: Text("loading ..."),
                        );
                      })
                ],
              ),
            ),
          );
        });
  }
}
