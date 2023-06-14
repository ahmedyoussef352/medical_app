// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class ButtonProfile extends StatefulWidget {
  String string;
  double width;
  VoidCallback voidCallback;
  ButtonProfile(
      {super.key,
      required this.string,
      required this.width,
      required this.voidCallback});

  @override
  State<ButtonProfile> createState() => _ButtonProfileState();
}

class _ButtonProfileState extends State<ButtonProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: widget.voidCallback,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: size.width / 8,
            width: size.width / widget.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              widget.string,
              style: TextStyle(
                color: black.withOpacity(.8),
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
