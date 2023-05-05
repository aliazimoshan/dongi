import 'package:dongi/core/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/user_model.dart';
import '../../../services/auth_service.dart';
import '../../../services/user_service.dart';
import 'sign_in_controller.dart';

part 'sign_up_controller.freezed.dart';

final signUpNotifierProvider =
    StateNotifierProvider<SignUpNotifier, SignUpState>((ref) {
  return SignUpNotifier(
    authAPI: ref.watch(authAPIProvider),
    userAPI: ref.watch(userAPIProvider),
  );
});

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.init() = SignUpInitState;
  const factory SignUpState.loading() = SignUpLoadingState;
  const factory SignUpState.loaded() = SignUpLoadedState;
  const factory SignUpState.error(String message) = SignUpErrorState;
}

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier({
    required this.authAPI,
    required this.userAPI,
  }) : super(const SignUpState.init());

  final AuthAPI authAPI;
  final UserAPI userAPI;

  Future<SignUpState> signUp({
    required WidgetRef ref,
    required String email,
    required String userName,
    required String password,
  }) async {
    state = const SignUpState.loading();
    final res = await authAPI.signUp(
      email: email,
      password: password,
    );

    return state = await res.fold(
      (l) => SignUpState.error(l.message),
      (r) async {
        UserModel userModel = UserModel(
          email: email,
          userName: userName,
        );
        final res2 = await userAPI.saveUserData(userModel);
        return res2.fold(
          (l) => SignUpState.error(l.message),
          (r) {
            ref
                .read(signInNotifierProvider.notifier)
                .signIn(email: email, password: password);
            return const SignUpState.loaded();
          },
        );
      },
    );
  }
}
