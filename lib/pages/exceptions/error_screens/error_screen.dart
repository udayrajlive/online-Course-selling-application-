 import 'package:flutter/material.dart';

 class ErrorScreen extends StatelessWidget {
   const ErrorScreen({required this.error, super.key});
   final Exception? error;

   @override
   Widget build(BuildContext context) {
     /// this we will change its just for the exceptions;


     return  Scaffold(
       appBar: AppBar(),
       body: Center(
         child:  Text(
           error.toString(),
           
         ),
       ),
     );
   }
 }
