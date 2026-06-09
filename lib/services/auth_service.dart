import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  static Future<User?> signInWithGoogle() async {
    if (Firebase.apps.isEmpty) {
      throw Exception('Firebase belum dikonfigurasi.');
    }

    if (kIsWeb) {
      return _signInWithGoogleWeb();
    }

    return _signInWithGoogleMobile();
  }

  static Future<User?> _signInWithGoogleWeb() async {
    debugPrint('[AuthService] Web: signInWithPopup...');
    try {
      final provider = GoogleAuthProvider();
      final result = await FirebaseAuth.instance.signInWithPopup(provider);
      debugPrint('[AuthService] Web: sign-in success: ${result.user?.email}');
      return result.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('[AuthService] Web FirebaseAuthException: code=${e.code}, message=${e.message}');
      if (e.code == 'popup-closed-by-user' || e.code == 'cancelled-popup-request') {
        return null;
      }
      throw Exception('Google Sign-In gagal (${e.code}): ${e.message}');
    } catch (e) {
      debugPrint('[AuthService] Web unexpected error: $e');
      throw Exception('Google Sign-In gagal: $e');
    }
  }

  static Future<User?> _signInWithGoogleMobile() async {
    debugPrint('[AuthService] Mobile: signInWithProvider...');
    try {
      // Menggunakan cara universal bawaan Firebase Auth yang tidak bergantung pada package google_sign_in langsung
      final provider = GoogleAuthProvider();
      final result = await FirebaseAuth.instance.signInWithProvider(provider);
      
      debugPrint('[AuthService] Mobile sign-in success: ${result.user?.email}');
      return result.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('[AuthService] FirebaseAuthException: code=${e.code}, message=${e.message}');
      throw Exception('Firebase Auth gagal (${e.code}): ${e.message}');
    } catch (e) {
      debugPrint('[AuthService] Mobile unexpected error: $e');
      throw Exception('Google Sign-In gagal: $e');
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}