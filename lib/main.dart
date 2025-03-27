import 'package:flutter/material.dart';
import 'package:flutter_app/business/conteurpage.dart';
import 'package:flutter_app/business/gallerypage.dart';
import 'package:flutter_app/business/homepage.dart';
import 'package:flutter_app/business/meteopage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppRoutes {
    static const String meteo = "/meteo";
    static const String gallery = "/gallery";
    static const String conteur = "/conteur"; 
    static const String home = "/home"; 
  }
void main(){
  runApp( ProviderScope(child: app()));
}
class app extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       routes: {
       AppRoutes.meteo :(context)=>Meteopage(),
         AppRoutes.gallery:(context)=>Gallerypage(),
          AppRoutes.conteur:(context)=>Conteurpage(),
          AppRoutes.home:(context)=>Homepage(),
  },
  initialRoute: "/meteo",
      theme:ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      debugShowCheckedModeBanner: false,
    
     );
  }
 

}
 