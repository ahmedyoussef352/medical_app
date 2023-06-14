// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/linkapi.dart';
import '../../../../../core/cubit/home_layout/cubit.dart';
import '../../../../../core/cubit/home_layout/states.dart';
import '../../../../../data/auth_service/crud.dart';
import '../../../../../data/model/appoint_model.dart';
import '../../../../componants/components.dart';
import '../../../../widgets/appointment_card_doc.dart';
import '../appoint_ment_screen.dart';

class PastDoc extends StatefulWidget {
  const PastDoc({super.key});

  @override
  State<PastDoc> createState() => _PastDocState();
}

class _PastDocState extends State<PastDoc> with Crud {
  // getAppointment() async {
  //   var response = await postRequest(
  //       linkPastAppointment, {"id": sharedPrefUser.getString("id")});
  //   return response;
  // }

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
                      future: cubit.getAppointmentPastDoc(),
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
                                    delete: ()async{
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
                                    date: true,
                                    cancel: () {},
                                    // date: true,
                                    appointmentmodel: AppointmentModel.fromJson(
                                        snapshot.data['data'][i]),
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
