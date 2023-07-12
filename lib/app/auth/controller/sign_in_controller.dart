import 'package:dongi/models/user_model.dart';
import 'package:dongi/services/auth_service.dart';
import 'package:dongi/services/user_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_controller.dart';

part 'sign_in_controller.freezed.dart';

final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>((ref) {
  return SignInNotifier(
    ref: ref,
    authAPI: ref.watch(authAPIProvider),
    userAPI: ref.watch(userAPIProvider),
  );
});

@freezed
class SignInState with _$SignInState {
  const factory SignInState.init() = SignInInitState;
  const factory SignInState.loading({@Default(false) bool isGoogle}) =
      SignInLoadingState;
  const factory SignInState.loaded() = SignInLoadedState;
  const factory SignInState.error(String message) = SignInErrorState;
}

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier({
    required this.ref,
    required this.authAPI,
    required this.userAPI,
  }) : super(const SignInState.init());

  final AuthAPI authAPI;
  final UserAPI userAPI;
  final Ref ref;

  Future<void> signIn({required String email, required String password}) async {
    state = const SignInState.loading();

    final res = await authAPI.signIn(
      email: email,
      password: password,
    );

    state = res.fold(
      (l) => SignInState.error(l.message),
      (r) {
        // Save User data to provider
        ref.read(currentUserProvider.notifier).state = r;
        return const SignInState.loaded();
      },
    );
  }

  void signInWithGoogle() async {
    state = const SignInState.loading(isGoogle: true);
    final res = await authAPI.signInWithGoogle();

    state = await res.fold(
      (l) => SignInState.error(l.message),
      (r) async {
        UserModel userModel = UserModel(
          email: r.email,
          userName: r.name,
        );
        // Save User data to provider
        ref.read(currentUserProvider.notifier).state = r;
        //Todo | If the user has an account don't save  data just update it if needed
        //and the snackbar should not pop up
        final res2 = await userAPI.saveUserData(userModel, r.$id);
        return res2.fold(
          (l) => SignInState.error(l.message),
          (r) => const SignInState.loaded(),
        );
      },
    );
  }
}
