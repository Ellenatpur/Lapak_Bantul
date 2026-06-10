// KITA BERSIHKAN SEMUA IMPORT FIREBASE YANG MEMBUAT ERROR INVALID_API_KEY DI WEB

class AuthService {
  // Membuat fungsi kosong agar login_page atau file lain tidak ikut error saat memanggilnya
  static Future<dynamic> signInWithGoogle() async {
    return null;
  }

  static Future<void> signOut() async {
    // Kosong
  }
}