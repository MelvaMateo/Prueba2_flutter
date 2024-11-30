import 'package:flutter/material.dart';  
import 'package:provider/provider.dart';  
import '../providers/visitor_provider.dart';  
import '../../data/models/visitor_model.dart';  

class VisitorForm extends StatefulWidget {  
  @override  
  _VisitorFormState createState() => _VisitorFormState();  
}  

class _VisitorFormState extends State<VisitorForm> {  
  final _formKey = GlobalKey<FormState>();  
  String name = '';  
  String identification = '';  
  String visitReason = '';  
  String visitedPerson = '';  
  DateTime entryTime = DateTime.now();  
  DateTime exitTime = DateTime.now();  
  String transportMode = '';  
  String companions = '';  
  String photoUrl = '';  

  @override  
  Widget build(BuildContext context) {  
    return AlertDialog(  
      title: Text('Agregar Visitante'),  
      content: Form(  
        key: _formKey,  
        child: Column(  
          mainAxisSize: MainAxisSize.min,  
          children: [  
            TextFormField(  
              decoration: InputDecoration(labelText: 'Nombre'),  
              onChanged: (value) => name = value,  
              validator: (value) => value!.isEmpty ? 'Ingrese un nombre' : null,  
            ),  
            TextFormField(  
              decoration: InputDecoration(labelText: 'Identificación'),  
              onChanged: (value) => identification = value,  
              validator: (value) => value!.isEmpty ? 'Ingrese una identificación' : null,  
            ),  
            // Agrega más campos según sea necesario  
            ElevatedButton(  
              onPressed: () {  
                if (_formKey.currentState!.validate()) {  
                  final visitor = Visitor(  
                    id: '', // Se generará al agregar a Firestore  
                    name: name,  
                    identification: identification,  
                    visitReason: visitReason,  
                    visitedPerson: visitedPerson,  
                    entryTime: entryTime,  
                    exitTime: exitTime,  
                    transportMode: transportMode,  
                    companions: companions,  
                    photoUrl: photoUrl,  
                  );  
                  Provider.of<VisitorProvider>(context, listen: false).addVisitor(visitor);  
                  Navigator.of(context).pop();  
                }  
              },  
              child: Text('Agregar'),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}