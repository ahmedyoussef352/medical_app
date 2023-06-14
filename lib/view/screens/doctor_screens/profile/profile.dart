// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/data/model/info_model.dart';
import 'package:medical_app/main.dart';

import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../widgets/profile/profile_doc_info.dart';


class ProfileScreenDoc extends StatefulWidget {
  const ProfileScreenDoc({
    super.key,
  });

  @override
  State<ProfileScreenDoc> createState() => _ProfileScreenDocState();
}

class _ProfileScreenDocState extends State<ProfileScreenDoc> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
              body: ListView(children: [
            FutureBuilder(
                future: cubit.getDoc(id: sharedPrefDoc.getString("id").toString()),
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
                        // scrollDirection: Axis.vert,
                        itemBuilder: (context, i) {
                          return ProfileItemDoc(
                            infoModel:
                                InfoModel.fromJson(snapshot.data['data'][i]),
                          );
                        });
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
          ]));
        });
  }
}
