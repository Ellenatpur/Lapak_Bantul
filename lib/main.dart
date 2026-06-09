import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'package:lapak_batul/config/env.dart';        
import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  // KITA HAPUS dotenv.load karena datanya sudah langsung dibaca dari Env class di bawah:
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Env.firebaseAndroidApiKey, 
      appId: Env.firebaseAndroidAppId,   
      messagingSenderId: Env.firebaseMessagingSenderId,
      projectId: Env.firebaseProjectId,
      storageBucket: Env.firebaseStorageBucket,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LaPak Bantul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF003566)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}