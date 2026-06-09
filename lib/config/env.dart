import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  // Mengambil data API Reqres dari file .env luar
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? "https://reqres.in/api";
  static String get apiKey => dotenv.env['API_KEY'] ?? "";

  // Data konfigurasi Firebase statis milikmu
  static const String firebaseProjectId = "lapak-batul-xxxxx";
  static const String firebaseAndroidApiKey = "AIzaSyAxxxxxxxxxxxxxx";
  static const String firebaseAndroidAppId = "1:1234567890:android:xxxxxxxxxx";
  static const String firebaseMessagingSenderId = "1234567890";
  static const String firebaseStorageBucket = "lapak-batul-xxxxx.appspot.com";
}