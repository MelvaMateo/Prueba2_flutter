import 'package:cloud_firestore/cloud_firestore.dart';  
import '../models/visitor_model.dart';  

class VisitorRepository {  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;  

  Future<void> addVisitor(Visitor visitor) async {  
    await _firestore.collection('VISITANTE').add(visitor.toMap());  
  }  

  Future<List<Visitor>> getVisitors() async {  
    final snapshot = await _firestore.collection('VISITANTE').get();  
    return snapshot.docs  
        .map((doc) => Visitor.fromMap(doc.id, doc.data() as Map<String, dynamic>))  
        .toList();  
  }  

  Future<void> updateVisitor(Visitor visitor) async {  
    await _firestore.collection('VISITANTE').doc(visitor.id).update(visitor.toMap());  
  }  

  Future<void> deleteVisitor(String id) async {  
    await _firestore.collection('VISITANTE').doc(id).delete();  
  }  
}