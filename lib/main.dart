import 'package:flutter/material.dart';
import 'package:provider/menu_dashboard_layout.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
  
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
     
    ));

   
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       
        debugShowCheckedModeBanner: false,
        
        title: 'Provider',
        theme: AppTheme.lightTheme,
        //darkTheme: AppTheme.darkTheme,
        home:  MenuDashboardPage(), 
        //TaskPage(),
        );

      
  }
}
