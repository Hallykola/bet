import 'dart:ui';
import 'package:multiselectchipgroup/multiselectchipgroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';
import 'package:filter_list/filter_list.dart';

class Concept3Chips extends StatefulWidget {
  Concept3Chips();

  @override
  Concept3ChipsState createState() => new Concept3ChipsState();
}

class Concept3ChipsState extends State<Concept3Chips> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8F7AFE),
        centerTitle: true,
        title: Text(
          "Concept 3 Chips Select",
          style: TextStyle(
              fontFamily: "Sofia", color: Colors.white, fontSize: 17.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MultiSelectChipGroup(
              items: ['Hello', 'Firoz', 'Evan', 'Nadia', 'Alex'],
              preSelectedItems: [
                'Evan',
                'Nadia',
              ],
              onSelectionChanged: (values) {
                print(values);
              },
              horizontalChipSpacing: 10,
              selectedColor: Colors.green,
              disabledColor: Colors.white,
              leftCommonIcon: Icons.perm_identity,
              leftIcons: [
                Icons.alarm,
                Icons.ac_unit,
                Icons.accessibility,
                Icons.account_balance,
                Icons.perm_identity,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
