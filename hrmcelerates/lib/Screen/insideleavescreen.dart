import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:hrmcelerates/widget/allwidget.dart';
import 'package:flutter/material.dart';

class InsideLeavescreen extends StatefulWidget {
  const InsideLeavescreen({Key? key}) : super(key: key);

  @override
  State<InsideLeavescreen> createState() => _InsideLeavescreen();
}

class _InsideLeavescreen extends State<InsideLeavescreen> {
  @override
  Widget build(BuildContext context) {
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
                  TitlePanelVocation(),
                  SizedBox(height: 20),
                  GridEmployepaidleave(),
                ],
              ),
            ])));
  }
}
