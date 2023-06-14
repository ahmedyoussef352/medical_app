// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unused_element


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../modules/home_layout/more/menu.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final int _currentIndex = 0;

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: const Center(
            child: Text('This is a bottom sheet!'),
          ),
        );
      },
    );
  }
    void showMyBottomSheet() {
   showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return  MyBottomSheet(user: true,);
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
    return cubit.currentIndex < 3?
     Scaffold(
      body:cubit.screens[cubit.currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.blue,
        buttonBackgroundColor: Colors.blue,
        height: 50,
        index: cubit.currentIndex,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 20,
            color: Colors.white,
          ),
          Icon(Icons.monitor_heart_outlined, size: 20),
          Icon(Icons.notifications, size: 20),
          Icon(Icons.menu, size: 20),
        ],
        onTap: (index) {
          setState(() {
            cubit.currentIndex = index;
          });
        },
      ),
    )
    :Scaffold(
      body:cubit.screens[cubit.currentIndex -3],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.blue,
        buttonBackgroundColor: Colors.blue,
        height: 50,
        index: _currentIndex,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 20,
            color: Colors.white,
          ),
          Icon(Icons.monitor_heart_outlined, size: 20),
          Icon(Icons.notifications, size: 20),
          Icon(Icons.menu, size: 20),
        ],
        onTap: (index) {
          setState(() {
            cubit.currentIndex = index;
            if (cubit.currentIndex == 3) {
              showMyBottomSheet();
            }
          });
        },
      ),
    );
  })
    ;
  }
}
