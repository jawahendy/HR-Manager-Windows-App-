import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmcelerates/Routes/leavescreen.dart';
import 'package:hrmcelerates/Routes/mailroute.dart';
import 'package:hrmcelerates/Routes/reportroute.dart';
import 'package:hrmcelerates/Screen/insidewindowshome.dart';
import 'package:hrmcelerates/provider/provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EmployeeProvider(),
        ),
      ],
      child: const MaterialApp(
        home: Mainscreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Mainscreen extends StatelessWidget {
  const Mainscreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: WindowBorder(
              color: const Color(0xFF805306),
              width: 1,
              child: Row(children: const [conteninsidehome()])),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                heroTag: 9,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const Mainscreen()),
                      (Route<dynamic> route) => false);
                },
                backgroundColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 42, 45, 90),
                    ),
                    Text(
                      "Home",
                      style: GoogleFonts.openSans(
                        color: const Color.fromARGB(255, 42, 45, 90),
                        fontWeight: FontWeight.bold,
                        fontSize: 7,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                heroTag: 3,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Leavescreen()),
                  );
                },
                backgroundColor: const Color.fromARGB(255, 42, 45, 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.airplane_ticket,
                      color: Colors.white,
                    ),
                    Text(
                      "Vocation",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 7,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                heroTag: 2,
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Reportscreen()),
                  );
                },
                backgroundColor: const Color.fromARGB(255, 42, 45, 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.bar_chart,
                      color: Colors.white,
                    ),
                    Text(
                      "Report",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 7,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                heroTag: 1,
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MailRoute()),
                  );
                },
                backgroundColor: const Color.fromARGB(255, 42, 45, 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    Text(
                      "Mail",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 7,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        ));
  }
}
