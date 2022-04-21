import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmcelerates/provider/provider.dart';
import 'package:provider/provider.dart';

final buttonColors = WindowButtonColors(
    iconNormal: const Color.fromARGB(255, 42, 45, 90),
    mouseOver: const Color.fromARGB(255, 42, 45, 90),
    mouseDown: const Color.fromARGB(255, 42, 45, 90),
    iconMouseOver: Colors.white,
    iconMouseDown: Colors.white);

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color.fromARGB(255, 42, 45, 90),
    mouseDown: const Color.fromARGB(255, 42, 45, 90),
    iconNormal: const Color.fromARGB(255, 42, 45, 90),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}

class AccountPanel extends StatelessWidget {
  const AccountPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.97,
      child: Consumer<EmployeeProvider>(
        builder: (context, value, child) => NeumorphicButton(
          onPressed: () {},
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            depth: 5,
            intensity: 0.9,
            // lightSource: LightSource.topLeft,
            color: const Color.fromARGB(255, 42, 45, 90),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Image.network(
                        (value.singleemployeename['avatar'] == null)
                            ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                            : value.singleemployeename['avatar'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (value.singleemployeename['first_name'] == null)
                            ? "Name People"
                            : value.singleemployeename['first_name'],
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "HR Mananger",
                        style: GoogleFonts.openSans(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 60,
                  width: 60,
                  child: Image.asset(
                    "assets/img/logoaja.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitlePanelPeople extends StatelessWidget {
  const TitlePanelPeople({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        width: 100,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.people,
                  color:
                      const Color.fromARGB(255, 104, 112, 220).withOpacity(0.2),
                  size: 42,
                ),
                const SizedBox(width: 10),
                NeumorphicText(
                  "PEOPLE",
                  style: const NeumorphicStyle(
                    depth: 4, //customize depth here
                    color:
                        Color.fromARGB(255, 42, 45, 90), //customize color here
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold, //customize size here
                  ),
                ),
              ],
            ),
            Row(
              children: [
                NeumorphicButton(
                  onPressed: () {},
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    depth: 5,
                    intensity: 0.9,
                    color: const Color.fromARGB(255, 104, 112, 220)
                        .withOpacity(0.7),
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "Paid Leave",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                NeumorphicButton(
                  onPressed: () {},
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    depth: 5,
                    intensity: 0.9,
                    color: const Color.fromARGB(255, 42, 45, 90),
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "New Employee",
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
    ]);
  }
}

class GridEmployeeall extends StatelessWidget {
  const GridEmployeeall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 80,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.67,
          width: MediaQuery.of(context).size.width * 0.93,
          child: Consumer<EmployeeProvider>(
            builder: (context, value, child) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                mainAxisExtent: 250,
              ),
              itemCount: value.allgetdataEmployee,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 100,
                    width: 50,
                    child: NeumorphicButton(
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        depth: 5,
                        intensity: 0.9,
                        color: const Color.fromARGB(255, 104, 112, 220)
                            .withOpacity(0.2),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                (value.alldataemployee[index]['avatar'] == null)
                                    ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                                    : value.alldataemployee[index]['avatar'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            (value.alldataemployee[index]['first_name'] == null)
                                ? "Name People"
                                : value.alldataemployee[index]['first_name'],
                            style: GoogleFonts.openSans(
                              color: const Color.fromARGB(255, 42, 45, 90),
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            (value.alldataemployee[index]['email'] == null)
                                ? "Email"
                                : value.alldataemployee[index]['email'],
                            style: GoogleFonts.openSans(
                              color: const Color.fromARGB(255, 42, 45, 90),
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 15),
                          NeumorphicButton(
                            onPressed: () {},
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              color: const Color.fromARGB(255, 42, 45, 90),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                            ),
                            child: Text(
                              "Detail",
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TitlePanelVocation extends StatelessWidget {
  const TitlePanelVocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        width: 100,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: [
            Icon(
              Icons.airplanemode_on_sharp,
              color: const Color.fromARGB(255, 104, 112, 220).withOpacity(0.2),
              size: 40,
            ),
            const SizedBox(width: 10),
            NeumorphicText(
              "PAID LEAVE",
              style: const NeumorphicStyle(
                depth: 4, //customize depth here
                color: Color.fromARGB(255, 42, 45, 90), //customize color here
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold, //customize size here
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class GridEmployepaidleave extends StatelessWidget {
  const GridEmployepaidleave({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 80,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.67,
          width: MediaQuery.of(context).size.width * 0.93,
          child: Consumer<EmployeeProvider>(
            builder: (context, value, child) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                mainAxisExtent: 250,
              ),
              itemCount: value.allgetdatapaidleave,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 100,
                    width: 50,
                    child: NeumorphicButton(
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        depth: 5,
                        intensity: 0.9,
                        color: const Color.fromARGB(255, 104, 112, 220)
                            .withOpacity(0.2),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                (value.alldataPaidLeave[index]['avatar'] ==
                                        null)
                                    ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                                    : value.alldataPaidLeave[index]['avatar'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            (value.alldataPaidLeave[index]['first_name'] ==
                                    null)
                                ? "Name People"
                                : value.alldataPaidLeave[index]['first_name'],
                            style: GoogleFonts.openSans(
                              color: const Color.fromARGB(255, 42, 45, 90),
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            (value.alldataPaidLeave[index]['email'] == null)
                                ? "Email"
                                : value.alldataPaidLeave[index]['email'],
                            style: GoogleFonts.openSans(
                              color: const Color.fromARGB(255, 42, 45, 90),
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 15),
                          NeumorphicButton(
                            onPressed: () {},
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              color: const Color.fromARGB(255, 42, 45, 90),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                            ),
                            child: Text(
                              "Back To Work",
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TitlePanelReport extends StatelessWidget {
  const TitlePanelReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        width: 100,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: [
            Icon(
              Icons.bar_chart_rounded,
              color: const Color.fromARGB(255, 104, 112, 220).withOpacity(0.2),
              size: 42,
            ),
            const SizedBox(width: 10),
            NeumorphicText(
              "REPORT",
              style: const NeumorphicStyle(
                depth: 4, //customize depth here
                color: Color.fromARGB(255, 42, 45, 90), //customize color here
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold, //customize size here
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class TitlePanelMail extends StatelessWidget {
  const TitlePanelMail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        width: 100,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: [
            Icon(
              Icons.mail,
              color: const Color.fromARGB(255, 104, 112, 220).withOpacity(0.2),
              size: 42,
            ),
            const SizedBox(width: 10),
            NeumorphicText(
              "MAIL",
              style: const NeumorphicStyle(
                depth: 4, //customize depth here
                color: Color.fromARGB(255, 42, 45, 90), //customize color here
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold, //customize size here
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
