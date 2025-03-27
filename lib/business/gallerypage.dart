import 'package:flutter/material.dart';

class Gallerypage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GalleryPage",style:TextStyle(color:Colors.deepOrange),),
      ),
      body: Center(
        child: Text("Gallery",style: TextStyle(color: Colors.deepOrange),),
      ),
    );
  }

}