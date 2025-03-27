import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Compteurprovider extends Notifier<int>{
  @override
  int build()=> 0;

   incrementer(){
    state = state +1;
   }
    reset(){
      state = 0;
    }

}
final compteurprovider = NotifierProvider<Compteurprovider,int>(Compteurprovider.new);