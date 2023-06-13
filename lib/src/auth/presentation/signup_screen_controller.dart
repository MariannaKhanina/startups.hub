import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreenController
    extends StateNotifier<AsyncValue<UserCredential?>> {
  SignupScreenController() : super(const AsyncData(null));
  save(String login, String password) async {
    try {
      state = const AsyncLoading();
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: login, password: password);
      state = AsyncData(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        state =
            AsyncError('Указанный пароль слишком простой.', StackTrace.current);
        return;
      } else if (e.code == 'email-already-in-use') {
        state = AsyncError(
            'Аккаунт для данной почты уже существует.', StackTrace.current);
        return;
      }
      state = AsyncError(e.message!, StackTrace.current);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

final signupScreenControllerProvider =
    StateNotifierProvider<SignupScreenController, AsyncValue<UserCredential?>>(
        (ref) => SignupScreenController());
