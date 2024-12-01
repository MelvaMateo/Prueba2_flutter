class Visitor {  
  String id;  
  String name;  
  String identification;  
  String visitReason;  
  String visitedPerson;  
  DateTime entryTime;  
  DateTime exitTime;  
  String transport;  
  String companions;  
  String photoUrl;  

  Visitor({  
    required this.id,  
    required this.name,  
    required this.identification,  
    required this.visitReason,  
    required this.visitedPerson,  
    required this.entryTime,  
    required this.exitTime,  
    required this.transport,  
    required this.companions,  
    required this.photoUrl,  
  });  

  Map<String, dynamic> toMap() {  
    return {  
      'name': name,  
      'identification': identification,  
      'visitReason': visitReason,  
      'visitedPerson': visitedPerson,  
      'entryTime': entryTime.toIso8601String(),  
      'exitTime': exitTime.toIso8601String(),  
      'transport': transport,  
      'companions': companions,  
      'photoUrl': photoUrl,  
    };  
  }  

  static Visitor fromMap(String id, Map<String, dynamic> map) {  
    return Visitor(  
      id: id,  
      name: map['name'],  
      identification: map['identification'],  
      visitReason: map['visitReason'],  
      visitedPerson: map['visitedPerson'],  
      entryTime: DateTime.parse(map['entryTime']),  
      exitTime: DateTime.parse(map['exitTime']),  
      transport: map['transport'],  
      companions: map['companions'],  
      photoUrl: map['photoUrl'],  
    );  
  }  
}