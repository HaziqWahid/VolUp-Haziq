import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:temp_flutter3/pages/navpages/home_page2.dart';

 Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

  
      home:
      /*
       detailPage2(
        userName: ' Emilia-chan',
        title:"Volunteering T1",
        description: ' Help us doing volunteering stuff and get reward from god',
       location: 'Kajang, My', ),*/
        
    HomePage2(),
      //Donation(),
    );
  }

}

