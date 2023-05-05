import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/homescreen.dart';


void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Homescreen(index: 0);
  }
}
