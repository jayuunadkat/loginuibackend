import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:loginuibackend/displaypage.dart';
import 'package:loginuibackend/formpage1.dart';
import 'package:sqflite/sqflite.dart';
import 'package:loginuibackend/insertpagebackend.dart';

void main() {
  runApp(MaterialApp(
    home: page1(),
  ));
}
class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return displatpage();
  }
}
