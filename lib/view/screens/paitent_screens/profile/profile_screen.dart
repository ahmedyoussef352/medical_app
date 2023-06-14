// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/data/model/profile_model.dart';
import 'package:medical_app/main.dart';
import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../componants/components.dart';
import '../../../widgets/profile/profile_item.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
              body: ListView(children: [
            FutureBuilder(
                future: cubit.getProfiledata(
                    id: sharedPrefUser.getString("id").toString()),
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
                          return ProfileItem(
                            edit: () {
                              navigatTo(
                                  context,
                                  EditProfile(
                                    profile: snapshot.data['data'][i],
                                  ));
                            },
                            pofileModel:
                                ProfileModel.fromJson(snapshot.data['data'][i]),
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

//   return ProfileInfo(
                          //   pofileModel: ProfileModel.fromJson(snapshot.data['data'][i]),
                          // );
            //  FutureBuilder(
            //     future: cubit.getProfiledata(id: sharedPrefUser.getString("id").toString()),
            //     builder: (BuildContext context, AsyncSnapshot snapshot) {
            //       if (snapshot.hasData) {
            //         if (snapshot.data['status'] == 'failed') {
            //           return const Center(
            //             child: Text('لا يوجد ملاحظات'),
            //           );
            //         }
            //         return ListView.builder(
            //             physics: const BouncingScrollPhysics(),
            //             itemCount: snapshot.data['data'].length,
            //             shrinkWrap: true,
            //             itemBuilder: (context, i) {
                          
// Expanded(
//                         child:
//                       );
