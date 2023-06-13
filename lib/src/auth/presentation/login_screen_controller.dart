import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreenController extends StateNotifier<AsyncValue<UserCredential?>> {
  LoginScreenController() : super(const AsyncData(null));
  login(String login, String password) async {
    try {
      state = const AsyncLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: login, password: password);
      state = AsyncData(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        state = AsyncError(
            'Пользователь с данной почтой не найден', StackTrace.current);
        return;
      } else if (e.code == 'wrong-password') {
        state = AsyncError('Указан неверный пароль для данного пользователя',
            StackTrace.current);
        return;
      }
      state = AsyncError(e.message!, StackTrace.current);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

final loginScreenControllerProvider =
    StateNotifierProvider<LoginScreenController, AsyncValue<UserCredential?>>(
        (ref) => LoginScreenController());
