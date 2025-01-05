import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasks/pages/list_page.dart';
import 'package:tasks/pages/sign_in_page.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;

  var userId = RxnString();
  var photoUrl = RxnString();
  var displayName = RxnString();
  var email = RxnString();
  var isLoading = false.obs;

  GoogleSignInAccount? _user;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();
    _checkInitialAuthState();

    userId.listen((_) => _saveToSharedPreferences());
    photoUrl.listen((_) => _saveToSharedPreferences());
    displayName.listen((_) => _saveToSharedPreferences());
    email.listen((_) => _saveToSharedPreferences());

    supabase.auth.onAuthStateChange.listen((data) {
      userId.value = data.session?.user.id;
      photoUrl.value = data.session?.user.userMetadata?['avatar_url'];
      displayName.value = data.session?.user.userMetadata?['full_name'];
      email.value = data.session?.user.email;
    });
  }

  Future<void> _checkInitialAuthState() async {
    await loadFromSharedPreferences();
    final session = supabase.auth.currentSession;
    if (session != null) {
      userId.value = session.user.id;
      photoUrl.value = session.user.userMetadata?['avatar_url'];
      displayName.value = session.user.userMetadata?['full_name'];
      email.value = session.user.email;
    }
  }

  Future<void> _saveToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId.value ?? '');
    await prefs.setString('photoUrl', photoUrl.value ?? '');
    await prefs.setString('displayName', displayName.value ?? '');
    await prefs.setString('email', email.value ?? '');
  }

  Future<void> loadFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    userId.value = prefs.getString('userId');
    photoUrl.value = prefs.getString('photoUrl');
    displayName.value = prefs.getString('displayName');
    email.value = prefs.getString('email');
  }

  Future<void> _clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    await prefs.remove('photoUrl');
    await prefs.remove('displayName');
    await prefs.remove('email');
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      const webClientId =
          '254437683901-cqn48fi0illc4qkjg2svoug27sab93do.apps.googleusercontent.com';
      const iosClientId = 'my-ios.apps.googleusercontent.com';

      final googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null || idToken == null) {
        throw 'Missing authentication tokens.';
      }

      await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      _user = googleUser;
      userId.value = supabase.auth.currentSession?.user.id;
      photoUrl.value = googleUser.photoUrl;
      displayName.value = googleUser.displayName;
      email.value = googleUser.email;

      Get.offAll(() => const ListPage());
    } catch (e) {
      Get.snackbar('Error', 'Please check your internet connection and try again.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      isLoading.value = true;
      await _googleSignIn.signOut();
      await supabase.auth.signOut();
      _user = null;
      userId.value = null;
      photoUrl.value = null;
      displayName.value = null;
      email.value = null;

      await _clearSharedPreferences();

      Get.offAll(() => SignInPage());
    } catch (e) {
      Get.snackbar('Error', 'Sign out failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  GoogleSignInAccount? get user => _user;
}
