import 'package:flutter/material.dart';  
import 'package:firebase_core/firebase_core.dart';  
import 'package:provider/provider.dart';  
import 'package:go_router/go_router.dart';  
import 'firebase_options.dart';  
import 'package:prueba2_flutter/presentation/providers/visitor_provider.dart';  
import 'package:prueba2_flutter/presentation/screens/home_screen.dart';  
import 'package:prueba2_flutter/presentation/screens/add_visitor_screen.dart'; 

void main() async {  
  WidgetsFlutterBinding.ensureInitialized();  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);  
  runApp(MyApp());  
}  

final GoRouter _router = GoRouter(  
  routes: [  
    GoRoute(  
      path: '/',  
      builder: (context, state) => HomeScreen(),  
    ),  
    GoRoute(  
      path: '/add',  
      builder: (context, state) => AddVisitorScreen(),  
    ),  
  ],  
  errorBuilder: (context, state) {  
    return Scaffold(  
      body: Center(  
        child: Text('Error: ${state.error}'),  
      ),  
    );  
  },  
);  

class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MultiProvider(  
      providers: [  
        ChangeNotifierProvider(create: (_) => VisitorProvider()),  
      ],  
      child: MaterialApp.router(  
        title: 'Prueba2 Flutter',  
        routerDelegate: _router.routerDelegate,  
        routeInformationParser: _router.routeInformationParser,  
        theme: ThemeData(  
          primarySwatch: Colors.blue,  
        ),  
      ),  
    );  
  }  
}  