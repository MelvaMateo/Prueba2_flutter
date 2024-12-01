import 'package:flutter/material.dart';  
import 'package:go_router/go_router.dart';  

class HomeScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(title: Text('Visitantes')),  
      body: Center(child: Text('Lista de Visitantes')),  
      floatingActionButton: FloatingActionButton(  
        onPressed: () {  
          GoRouter.of(context).go('/add');  
        },  
        child: Icon(Icons.add),  
      ), 