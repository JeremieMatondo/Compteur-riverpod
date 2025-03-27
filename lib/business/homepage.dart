import 'package:flutter/material.dart';
import 'package:flutter_app/business/meteopage.dart';
import 'package:flutter_app/main.dart';


class Homepage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
      appBar: AppBar(
        title: Text("HomePage",),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(child: Text("page d'acceuil",style:TextStyle(color: Colors.deepOrange,fontSize: 25,fontWeight: FontWeight.bold),),),
    );
  }

}
class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[
                Colors.deepOrange,
                Colors.white,
              ])
            ),
            child:
          CircleAvatar(
            backgroundImage: AssetImage("images/jeremie.jpeg"),
            radius: 50,
          ),),
        ListTile(
          title: Text("Conteur"),
          leading: Icon(Icons.home,color: Colors.deepOrange,),
          trailing: Icon(Icons.arrow_right,color: Colors.deepOrange,),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.conteur);
          },
          
        ),
         ListTile(
          title: Text("Meteo"),
          leading: Icon(Icons.map,color: Colors.deepOrange,),
          trailing: Icon(Icons.arrow_right,color: Colors.deepOrange,),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.meteo);
          },
          
        ),
         ListTile(
          title: Text("Gallery"),
          leading: Icon(Icons.image,color: Colors.deepOrange,),
          trailing: Icon(Icons.arrow_right,color: Colors.deepOrange,),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.gallery);
          },
          
        ),
        ],
        
      ),
      
      
    );
  }

}