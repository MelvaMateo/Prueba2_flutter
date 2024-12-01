import 'package:flutter/material.dart';  
import 'package:prueba2_flutter/data/repositories/visitor_repository.dart';
import 'package:prueba2_flutter/data/models/visitor_model.dart'; 

class VisitorProvider with ChangeNotifier {  
  final VisitorRepository _repository = VisitorRepository();  
  List<Visitor> _visitors = [];  

  List<Visitor> get visitors => _visitors;  

  Future<void> fetchVisitors() async {  
    _visitors = await _repository.getVisitors();  
    notifyListeners();  
  }  

  Future<void> addVisitor(Visitor visitor) async {  
    await _repository.addVisitor(visitor);  
    await fetchVisitors();  
  }  

  // Implementa métodos para actualizar y eliminar visitantes...  
} 