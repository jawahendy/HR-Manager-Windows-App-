import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmcelerates/Routes/home.dart';
import 'package:hrmcelerates/models/models.dart';
import 'package:hrmcelerates/widget/allwidget.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Insidemailscreen extends StatefulWidget {
  const Insidemailscreen({Key? key}) : super(key: key);

  @override
  State<Insidemailscreen> createState() => _InsidemailscreenState();
}

class _InsidemailscreenState extends State<Insidemailscreen> {
  @override
  Widget build(BuildContext context) {
    final emplist = [
      EmailEmployee(id: "1", email: "george.bluth@reqres.in", name: "george"),
      EmailEmployee(id: "2", email: "janet.weaver@reqres.in", name: "janet"),
      EmailEmployee(id: "3", email: "emma.wong@reqres.in", name: "emma"),
      EmailEmployee(id: "4", email: "eve.holt@reqres.in", name: "eve"),
      EmailEmployee(
          id: "5", email: "charles.morris@reqres.in", name: "charles"),
      EmailEmployee(id: "6", email: "tracey.ramos@reqres.in", name: "tracey"),
    ];

    final _items = emplist
        .map((empemail) =>
            MultiSelectItem<EmailEmployee>(empemail, empemail.email))
        .toList();

    List<EmailEmployee> selectedEmp = [];

    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
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
                const TitlePanelMail(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 100),
                    Center(
                      child: SizedBox(
                        height: 90,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: SingleChildScrollView(
                          child: MultiSelectDialogField<EmailEmployee>(
                            title: const Text("Email"),
                            buttonText: const Text("Email Employee",
                                style: TextStyle(color: Colors.grey)),
                            buttonIcon: const Icon(Icons.expand_more,
                                color: Colors.grey),
                            searchable: true,
                            items: _items,
                            listType: MultiSelectListType.CHIP,
                            onConfirm: (values) {
                              selectedEmp = values;
                            },
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 100),
                    SizedBox(
                      height: 170,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        controller: TextEditingController(),
                        keyboardType: TextInputType.multiline,
                        maxLines: 20,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 5, color: Colors.grey),
                          ),
                          hintText: 'Enter Your main detail Event For employee',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                NeumorphicButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const Mainscreen()),
                        (Route<dynamic> route) => false);
                  },
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    depth: 5,
                    intensity: 0.9,
                    color: const Color.fromARGB(255, 42, 45, 90),
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "Send Mail",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
