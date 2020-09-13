import 'package:flutter/material.dart';

import 'chatscreen.dart';
 class MyHomePage extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('buddies chat'),
       ),
       body:ChatScreen()
       
     );
   }
 }