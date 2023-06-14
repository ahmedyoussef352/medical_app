// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/info_model.dart';
import '../../../../../view/componants/components.dart';
import 'package:medical_app/view/modules/profile/profiledoc.dart';
import '../../../core/cubit/home_layout/cubit.dart';
import '../../../core/cubit/home_layout/states.dart';
import '../single.dart';

class InfoPsychiatrist extends StatefulWidget {
  String category;
   InfoPsychiatrist({super.key,required this.category});

  @override
  State<InfoPsychiatrist> createState() => _InfoPsychiatristState();
}

class _InfoPsychiatristState extends State<InfoPsychiatrist> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return  FutureBuilder(
                future: cubit.getNotes(category: widget.category),
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  if (snapshot.hasData) {
                    if (snapshot.data['status'] == 'failed') {
                      return const Center(
                        child: Text('لا يوجد ملاحظات'),
                      );
                    }
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data['data'].length,
                         shrinkWrap: true,
                           scrollDirection: Axis.horizontal,
                           
                        itemBuilder: (context, i) {
                          return SingleCardDoc(
                            infoModel:
                                InfoModel.fromJson(snapshot.data['data'][i]),
                            ontap: () {
                              navigatTo(context, Profiledoc(data: snapshot.data['data'][i],));
                            },
                          );
                        });
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const Center(
                    child: Text("Loading ..."),
                  );
        });
  }
);}
}










// return ConditionalBuilder(
//           builder: (BuildContext context,) {
//                   if (snapshot.hasData) {
//                     if (snapshot.data['status'] == 'failed') {
//                       return const Center(
//                         child: Text('لا يوجد ملاحظات'),
//                       );
//                     }
//                     return ListView.builder(
//                       physics: const BouncingScrollPhysics(),
//                         itemCount: snapshot.data['data'].length,
//                          shrinkWrap: true,
//                            scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, i) {
//                           return SingleCard(
//                             infoModel:
//                                 InfoModel.fromJson(snapshot.data['data'][i]),
//                             ontap: () {
//                               navigatTo(context, Profiledoc(data: snapshot.data['data'][i]));
//                             },
//                           );
//                         });
//                   }
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: Text("Loadingtfgjhkj ..."),
//                     );
//                   }
//                   return const Center(
//                     child: Text("Loading ..."),
//                   );
//         },
//           // ignore: unnecessary_null_comparison
//           condition: ( cubit.getNotes != null),
//           fallback: (BuildContext context) => const Center(
//                       child: CircularProgressIndicator(),
//                     ),);