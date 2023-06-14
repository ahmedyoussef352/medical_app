// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:medical_app/core/constant/colors.dart';

class ProfileFormField extends StatefulWidget {
  IconData icon;
  String hintText;
  TextInputType type;
  final String? Function(String?)? validate;
  TextEditingController mycontroller;

  ProfileFormField(
      {super.key,
      required  this.mycontroller,
      required this.hintText,
      required this.icon,
      required this.type,
      required this.validate});

  @override
  State<ProfileFormField> createState() => _ProfileFormFieldState();
}

class _ProfileFormFieldState extends State<ProfileFormField> {
  @override
  Widget build(BuildContext context) {
    bool isClickable = true;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 15,
            sigmaX: 15,
          ),
          child: Container(
            height: size.width / 8,
            width: size.width / 1.2,
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              right: size.width / 30,
            ),
            decoration: BoxDecoration(
              color: white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              controller: widget.mycontroller,
              validator: widget.validate,
              maxLines: 1,
              enabled: isClickable,
              style: TextStyle(color: black.withOpacity(.8)),
              cursorColor: white,
              keyboardType: widget.type,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  widget.icon,
                  color: black.withOpacity(.7),
                ),
                border: InputBorder.none,
                hintMaxLines: 1,
                hintText: widget.hintText,
                hintStyle:
                    TextStyle(fontSize: 14, color: black.withOpacity(.5)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
