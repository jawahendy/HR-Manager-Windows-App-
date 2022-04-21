import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:hrmcelerates/widget/allwidget.dart';
import 'package:flutter/material.dart';
import 'package:hrmcelerates/widget/barchartwidget.dart';
import 'package:hrmcelerates/widget/widgetcart.dart';

class Insidereportscreen extends StatefulWidget {
  const Insidereportscreen({Key? key}) : super(key: key);

  @override
  State<Insidereportscreen> createState() => _InsidereportscreenState();
}

class _InsidereportscreenState extends State<Insidereportscreen> {
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
                children: [
                  const SizedBox(height: 10),
                  const AccountPanel(),
                  const SizedBox(height: 20),
                  const TitlePanelReport(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 100),
                      Row(
                        children: const [
                          SizedBox(
                              height: 350,
                              width: 500,
                              child: LineChartSample1()),
                          SizedBox(width: 50),
                          SizedBox(
                              height: 350,
                              width: 500,
                              child: BarChartSample1()),
                          SizedBox(width: 10),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ])));
  }
}
