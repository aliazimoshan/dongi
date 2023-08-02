import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/group_model.dart';
import '../../services/home_service.dart';
import '../auth/controller/auth_controller.dart';
part 'home_controller.freezed.dart';

final homeNotifierProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) {
    return HomeNotifier(
      ref: ref,
      homeAPI: ref.watch(homeAPIProvider),
    );
  },
);

@freezed
class HomeState with _$HomeState {
  const factory HomeState.init() = HomeInitState;
  const factory HomeState.loading() = HomeLoadingState;
  const factory HomeState.loaded() = HomeLoadedState;
  const factory HomeState.error(String message) = HomeErrorState;
}

final getHomesProvider = FutureProvider((ref) {
  final homesController = ref.watch(homeNotifierProvider.notifier);
  return homesController.getLatestGroupsInHome();
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({
    required this.ref,
    required this.homeAPI,
  }) : super(const HomeState.init());

  final Ref ref;
  final HomeAPI homeAPI;

  Future<List<GroupModel>> getLatestGroupsInHome() async {
    final user = ref.read(currentUserProvider);
    final groupList = await homeAPI.getGroupsInHome(user!.$id);
    return groupList.map((group) => GroupModel.fromJson(group.data)).toList();
  }
}
