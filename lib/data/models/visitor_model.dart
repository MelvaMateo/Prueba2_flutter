class Visitor {  
  final String id;  
  final String name;  
  final String identification;  
  final String visitReason;  
  final String visitedPerson;  
  final DateTime entryTime;  
  final DateTime exitTime;  
  final String transportMode;  
  final String companions;  
  final String photoUrl;  

  Visitor({  
    required this.id,  
    required this.name,  
    required this.identification,  
    required this.visitReason,  
    required this.visitedPerson,  
    required this.entryTime,  
    required this.exitTime,  
    required this.transportMode,  
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
      'transportMode': transportMode,  
      'companions': companions,  
      'photoUrl': photoUrl,  
    };  
  }  

  factory Visitor.fromMap(String id, Map<String, dynamic> map) {  
    return Visitor(  
      id: id,  
      name: map['name'],  
      identification: map['identification'],  
      visitReason: map['visitReason'],  
      visitedPerson: map['visitedPerson'],  
      entryTime: DateTime.parse(map['entryTime']),  
      exitTime: DateTime.parse(map['exitTime']),  
      transportMode: map['transportMode'],  
      companions: map['companions'],  
      photoUrl: map['photoUrl'],  
    );  
  }  
}