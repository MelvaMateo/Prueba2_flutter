import 'package:flutter/material.dart';  
import '../../data/models/visitor_model.dart';  
import '../../data/repositories/visitor_repository.dart';  
import 'package:prueba2_flutter/domain/usecases/visitor_usacase.dart'; 

class VisitorProvider with ChangeNotifier {  
  final VisitorUseCase _visitorUseCase;  
  List<Visitor> _visitors = [];  

  VisitorProvider(this._visitorUseCase);  

  List<Visitor> get visitors => _visitors;  

  Future<void> fetchVisitors() async {  
    _visitors = await _visitorUseCase.getVisitors();  
    notifyListeners();  
  }  

  Future<void> addVisitor(Visitor visitor) async {  
    await _visitorUseCase.addVisitor(visitor);  
    await fetchVisitors();  
  }  

  Future<void> updateVisitor(Visitor visitor) async {  
    await _visitorUseCase.updateVisitor(visitor);  
    await fetchVisitors();  
  }  

  Future<void> deleteVisitor(String id) async {  
    await _visitorUseCase.deleteVisitor(id);  
    await fetchVisitors();  
  }  
}