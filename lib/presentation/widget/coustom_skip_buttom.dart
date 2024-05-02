
import 'package:flutter/material.dart';

Widget skipButton(dynamic onTap){
  return IconButton(
                onPressed: (){
                  onTap();
                },
                 icon: const Icon(Icons.arrow_back),
                 )
  
  ;
}