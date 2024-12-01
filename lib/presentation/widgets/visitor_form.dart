import 'package:flutter/material.dart';  
import 'package:provider/provider.dart';  
import '../providers/visitor_provider.dart';  
import '../../data/models/visitor_model.dart';  

class VisitorForm extends StatefulWidget {  
  final Visitor? visitor; // Para editar un visitante existente, si es necesario  

  VisitorForm({Key? key, this.visitor}) : super(key: key);  

  @override  
  _VisitorFormState createState() => _VisitorFormState();  
}  

class _VisitorFormState extends State<VisitorForm> {  
  final _formKey = GlobalKey<FormState>();  
  late String name;  
  late String identification;  
  late String visitReason;  
  late String visitedPerson;  
  late DateTime entryTime;  
  late DateTime exitTime;  
  late String transport;  
  late String companions;  
  late String photoUrl;  

  @override  
  void initState() {  
    super.initState();  
    // Si se está editando un visitante, inicializa los campos  
    if (widget.visitor != null) {  
      name = widget.visitor!.name;  
      identification = widget.visitor!.identification;  
      visitReason = widget.visitor!.visitReason;  
      visitedPerson = widget.visitor!.visitedPerson;  
      entryTime = widget.visitor!.entryTime;  
      exitTime = widget.visitor!.exitTime;  
      transport = widget.visitor!.transport;  
      companions = widget.visitor!.companions;  
      photoUrl = widget.visitor!.photoUrl;  
    } else {  
      // Inicializa los campos vacíos  
      name = '';  
      identification = '';  
      visitReason = '';  
      visitedPerson = '';  
      entryTime = DateTime.now();  
      exitTime = DateTime.now();  
      transport = '';  
      companions = '';  
      photoUrl = '';  
    }  
  }  

  @override  
  Widget build(BuildContext context) {  
    return Form(  
      key: _formKey,  
      child: Column(  
        children: [  
          TextFormField(  
            decoration: InputDecoration(labelText: 'Nombre'),  
            initialValue: name,  
            onSaved: (value) => name = value!,  
            validator: (value) => value!.isEmpty ? 'Por favor ingresa un nombre' : null,  
          ),  
          TextFormField(  
            decoration: InputDecoration(labelText: 'Identificación'),  
            initialValue: identification,  
            onSaved: (value) => identification = value!,  
            validator: (value) => value!.isEmpty ? 'Por favor ingresa una identificación' : null,  
          ),  
          TextFormField(  
            decoration: InputDecoration(labelText: 'Motivo de la Visita'),  
            initialValue: visitReason,  
            onSaved: (value) => visitReason = value!,  
            validator: (value) => value!.isEmpty ? 'Por favor ingresa el motivo de la visita' : null,  
          ),  
          TextFormField(  
            decoration: InputDecoration(labelText: 'A quién Visita'),  
            initialValue: visitedPerson,  
            onSaved: (value) => visitedPerson = value!,  
            validator: (value) => value!.isEmpty ? 'Por favor ingresa a quién visita' : null,  
          ),  
          TextFormField(  
            decoration: InputDecoration(labelText: 'Hora de Entrada'),  
            initialValue: entryTime.toString(),  
            onSaved: (value) => entryTime = DateTime.parse(value!),  
            validator: (value) => value!.isEmpty ? 'Por favor ingresa la hora de entrada' : null,  
          ),  
          TextFormField(  
            decoration: InputDecoration(labelText: 'Hora de Salida'),  
            initialValue: exitTime.toString(),  
            onSaved: (value) => exitTime = DateTime.parse(value!),  
            validator: (value) => value!.isEmpty ? 'Por favor ingresa la hora de salida' : null,  
          ),  
          TextFormField(  
            decoration: InputDecoration(labelText: 'Medio de Transporte'),  
            initialValue: transport,  
            onSaved: (value) => transport = value!,  
            validator: (value) => value!.isEmpty ? 'Por favor ingresa el medio de transporte' : null,  
          ),  
          TextFormField(  
            decoration: InputDecoration(labelText: 'Acompañantes'),  
            initialValue: companions,  
            onSaved: (value) => companions = value!,  
            validator: (value) => value!.isEmpty ? 'Por favor ingresa los acompañantes' : null,  
          ),  
          TextFormField(  
            decoration: InputDecoration(labelText: 'URL de la Fotografía'),  
            initialValue: photoUrl,  
            onSaved: (value) => photoUrl = value!,  
            validator: (value) => value!.isEmpty ? 'Por favor ingresa la URL de la fotografía' : null,  
          ),  
          SizedBox(height: 20),  
          ElevatedButton(  
            onPressed: () {  
              if (_formKey.currentState!.validate()) {  
                _formKey.currentState!.save();  
                final visitor = Visitor(  
                  id: widget.visitor?.id ?? '', // Si es un nuevo visitante, puedes generar un ID  
                  name: name,  
                  identification: identification,  
                  visitReason: visitReason,  
                  visitedPerson: visitedPerson,  
                  entryTime: entryTime,  
                  exitTime: exitTime,  
                  transport: transport,  
                  companions: companions,  
                  photoUrl: photoUrl,  
                );  

                // Agrega el visitante usando el VisitorProvider  
                Provider.of<VisitorProvider>(context, listen: false).addVisitor(visitor);  
                Navigator.pop(context); // Regresa a la pantalla anterior  
              }  
            },  
            child: Text(widget.visitor == null ? 'Agregar Visitante' : 'Actualizar Visitante'),  
          ),  
        ],  
      ),  
    );  
  }  
} 