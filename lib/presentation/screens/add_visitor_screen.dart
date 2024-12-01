import 'package:flutter/material.dart';  
import 'package:cloud_firestore/cloud_firestore.dart';  
import 'package:prueba2_flutter/data/models/visitor_model.dart';

class AddVisitorScreen extends StatelessWidget {  
  final _formKey = GlobalKey<FormState>();  
  final Visitor visitor = Visitor(id: '', name: '', identification: '', visitReason: '', visitedPerson: '', entryTime: DateTime.now(), exitTime: DateTime.now(), transport: '', companions: '', photoUrl: '');  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(title: Text('Agregar Visitante')),  
      body: Form(  
        key: _formKey,  
        child: Column(  
          children: [  
            TextFormField(  
              decoration: InputDecoration(labelText: 'Nombre'),  
              onSaved: (value) => visitor.name = value!,  
            ),  
            // Agrega más campos aquí...  
            ElevatedButton(  
              onPressed: () async {  
                if (_formKey.currentState!.validate()) {  
                  _formKey.currentState!.save();  
                  await FirebaseFirestore.instance.collection('VISITANTE').add(visitor.toMap());  
                  Navigator.pop(context);  
                }  
              },  
              child: Text('Guardar'),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}  