import '../../data/models/visitor_model.dart';  
import '../../data/repositories/visitor_repository.dart';  

class VisitorUseCase {  
  final VisitorRepository repository;  

  VisitorUseCase(this.repository);  

  Future<void> addVisitor(Visitor visitor) {  
    return repository.addVisitor(visitor);  
  }  

  Future<List<Visitor>> getVisitors() {  
    return repository.getVisitors();  
  }  

  Future<void> updateVisitor(Visitor visitor) {  
    return repository.updateVisitor(visitor);  
  }  

  Future<void> deleteVisitor(String id) {  
    return repository.deleteVisitor(id);  
  }  
}