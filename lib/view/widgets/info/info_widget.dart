// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/data/model/info_model.dart';
import 'package:medical_app/view/componants/components.dart';
import 'package:medical_app/view/modules/profile/profiledoc.dart';
import '../../../core/cubit/home_layout/cubit.dart';
import '../../../core/cubit/home_layout/states.dart';
import '../single_card_doc.dart';

class InfoWidget extends StatefulWidget {
  String category;
  InfoWidget({super.key, required this.category});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.blue[50],
            body: FutureBuilder(
                future: cubit.getNotes(category: widget.category),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['status'] == 'failed') {
                      return const Center(
                        child: Text('لا يوجد ملاحظات'),
                      );
                    }
                    return Container(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data['data'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return SingleCard(
                            infoModel:
                                InfoModel.fromJson(snapshot.data['data'][i]),
                            ontap: () {
                              navigatTo(
                                context,
                                Profiledoc(
                                  data: snapshot.data['data'][i],

                                  // chat: (){
                                  //   navigatTo(context, )}
                                ),
                              );
                            },
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const Center(
                    child: Text("Loading ..."),
                  );
                }),
          );
        });
  }
}
