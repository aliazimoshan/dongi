import 'package:dongi/extentions/round_double.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FriendsSelectorNotifier extends StateNotifier<List<String>> {
  FriendsSelectorNotifier() : super([]);

  List<String> get friends => state;

  void select(String friend) {
    if (state.contains(friend)) {
      state = state.where((val) => val != friend).toList();
    } else {
      state = [...state, friend];
    }
  }

  bool selectOrNot(String friend) {
    if (state.contains(friend)) {
      return true;
    } else {
      return false;
    }
  }

  void addAll(List<String> friends) {
    if (state.length == friends.length) {
      state = [];
    } else {
      state = friends;
    }
  }
}

final friendsSelectorProvider =
    StateNotifierProvider<FriendsSelectorNotifier, List<String>>((ref) {
  return FriendsSelectorNotifier();
});

//final splitProvider = Provider.family<String, double>(
//  (ref, amount) {
//    int lengthOfSelectedFriends = ref.watch(friendsSelectorProvider).length;

//    if (lengthOfSelectedFriends != 0) {
//      return (amount / lengthOfSelectedFriends).toStringAsFixed(2);
//    } else {
//      return "0";
//    }
//    "\$$splitViewModel / person(${friendViewModel.length})"
//  },
//);

class SplitNotifier extends StateNotifier<double> {
  final double amount;
  final StateNotifierProviderRef ref;
  SplitNotifier(this.ref, this.amount) : super(0);

  double value() {
    int lengthOfSelectedFriends = ref.watch(friendsSelectorProvider).length;
    if (lengthOfSelectedFriends != 0) {
      double amountPerPerson = (amount / lengthOfSelectedFriends).fixedDouble();
      return amountPerPerson;
    } else {
      return 0;
    }
  }

  @override
  String toString() {
    double amountPerPerson = value();
    if (amountPerPerson != 0) {
      int lengthOfSelectedFriends = ref.watch(friendsSelectorProvider).length;
      return "\$$amountPerPerson / person($lengthOfSelectedFriends)";
    } else {
      return "no one selected";
    }
  }
}

final splitProvider =
    StateNotifierProvider.family<SplitNotifier, double, double>((ref, amount) {
  return SplitNotifier(ref, amount);
});
