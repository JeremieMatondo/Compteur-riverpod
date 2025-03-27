import 'package:flutter/material.dart';
import 'package:flutter_app/business/compteurprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Conteurpage extends ConsumerStatefulWidget{
  @override
  ConteurpageState createState() => ConteurpageState();
}

class ConteurpageState extends ConsumerState<Conteurpage> {
  

  @override
  Widget build(BuildContext context) {
    final compteur = ref.watch(compteurprovider);
    return Scaffold(
      appBar: AppBar(
        title: Text("ConteurPage",style:TextStyle(color:Colors.deepOrange),),
      ),
      body: Center(
        child: Text("${compteur}",style: TextStyle(color: Colors.deepOrange),),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
             
            onPressed:  (){
             ref.read(compteurprovider.notifier).incrementer();
                 
          },
          
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.add,color: Colors.white,),),
          FloatingActionButton(
             
            onPressed:  (){
             ref.read(compteurprovider.notifier).reset();
                 
          },
          
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.reset_tv,color: Colors.white,),),
        ],
      ),
      
    
      
    );
  }
}