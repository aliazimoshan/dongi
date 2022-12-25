import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingViewModel extends StateNotifier<int> {
  OnboardingViewModel() : super(0);

  void onPageChanged(value) => state = value;
  int get page => state;
}

final onboardingProvider =
    StateNotifierProvider<OnboardingViewModel, int>((ref) {
  return OnboardingViewModel();
});
