import 'package:flutter/material.dart';  
import 'package:provider/provider.dart';  
import '../providers/visitor_provider.dart';  
import '../widgets/visitor_form.dart';  

class HomeScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    final visitorProvider = Provider.of<VisitorProvider>(context);  
    
    return Scaffold(  
      appBar: AppBar(title: Text('Gestión de Visitantes')),  
      body: FutureBuilder(  
        future: visitorProvider.fetchVisitors(),  
        builder: (context, snapshot) {  
          if (snapshot.connectionState == ConnectionState.waiting) {  
            return Center(child: CircularProgressIndicator());  
          }  
          return ListView.builder(  
            itemCount: visitorProvider.visitors.length,  
            itemBuilder: (context, index) {  
              final visitor = visitorProvider.visitors[index];  
              return ListTile(  
                title: Text(visitor.name),  
                subtitle: Text(visitor.visitReason),  
                trailing: IconButton(  
                  icon: Icon(Icons.delete),  
                  onPressed: () {  
                    visitorProvider.deleteVisitor(visitor.id);  
                  },  
                ),  
              );  
            },  
          );  
        },  
      ),  
      floatingActionButton: FloatingActionButton(  
        onPressed: () {  
          showDialog(  
            context: context,  
            builder: (context) => VisitorForm(),  
          );  
        },  
        child: Icon(Icons.add),  
      ),  
    );  
  }  
}