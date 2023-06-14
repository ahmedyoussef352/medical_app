// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ItemSetting extends StatefulWidget {
  final String title;
  final Color colorData;
  final IconData icon;
  late final bool value;
  ItemSetting(
      {required this.value,
      required this.title,
      required this.colorData,
      required this.icon,
      super.key});

  @override
  State<ItemSetting> createState() => _ItemSettingState();
}

class _ItemSettingState extends State<ItemSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.colorData,
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                )),
            title: Text(
              widget.title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            trailing: Switch(
              value: true,
              onChanged: (newValue) {
                setState(() {
                  setState(() {
                    widget.value = newValue;
                  });
                });
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
