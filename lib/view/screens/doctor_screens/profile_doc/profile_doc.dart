// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/data/model/profile_model.dart';
import 'package:medical_app/main.dart';

import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../componants/components.dart';
import '../../../widgets/profile/profile_info.dart';
import '../add_info/add_info.dart';

class ProfileDoc2 extends StatefulWidget {
  const ProfileDoc2({
    super.key,
  });

  @override
  State<ProfileDoc2> createState() => _ProfileDoc2State();
}

class _ProfileDoc2State extends State<ProfileDoc2> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return 
          // Scaffold(
          //   appBar: AppBar(),
          //   body:
           FutureBuilder(
                future:
                    cubit.getdoc(id: sharedPrefDoc.getString("id").toString()),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['status'] == 'failed') {
                      navigatTo(context, 
                      const AddInfo());
                    }
                    // return ListView.builder(
                    //     physics: const BouncingScrollPhysics(),
                    //     itemCount: snapshot.data['data'].length,
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, i) {
                    return ProfileInfo(
                      pofileModel:
                          ProfileModel.fromJson(snapshot.data['data'][0]),
                      // ontap: () {
                      //   navigatTo(context, Profiledoc(data: snapshot.data['data'][i]));
                      // },
                    );
                    //      });
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const Center(
                    child: Text("Loading ..."),
                  );
                });
         // );
        });
  }
}
