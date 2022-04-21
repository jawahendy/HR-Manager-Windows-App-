import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hrmcelerates/provider/provider.dart';
import 'package:hrmcelerates/widget/allwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class conteninsidehome extends StatefulWidget {
  const conteninsidehome({Key? key}) : super(key: key);

  @override
  State<conteninsidehome> createState() => _conteninsidehomeState();
}

// ignore: camel_case_types
class _conteninsidehomeState extends State<conteninsidehome> {
  @override
  void initState() {
    super.initState();
    // ignore: non_constant_identifier_names
    final DataEmployeeProvider =
        Provider.of<EmployeeProvider>(context, listen: false);
    DataEmployeeProvider.getallEmployee();
    DataEmployeeProvider.getallCutiEmployee();
    DataEmployeeProvider.getemployeebyid("1");
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final DataEmployeeProvider =
        Provider.of<EmployeeProvider>(context, listen: false);
    return Expanded(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(children: [
              WindowTitleBarBox(
                  child: Row(children: [
                Expanded(child: MoveWindow()),
                const WindowButtons(),
              ])),
              Column(
                children: const [
                  SizedBox(height: 10),
                  AccountPanel(),
                  SizedBox(height: 20),
                  TitlePanelPeople(),
                  SizedBox(height: 20),
                  GridEmployeeall(),
                ],
              ),
            ])));
  }
}
