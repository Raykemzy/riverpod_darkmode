import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_darkmode/providers/character_provider.dart';
import 'package:riverpod_darkmode/utils/enums/state_enums.dart';

import '../data/models/character_model.dart';

class CharacterNotifier extends StateNotifier<List<Result>> {
  final Ref ref;
  LoadStatus initialState = LoadStatus.inital;
  CharacterNotifier(this.ref) : super([]) {
    loadCharacters();
  }

  loadCharacters() {
    initialState = LoadStatus.loading;
    try {
      final apiList = ref.watch(characterListProvider);
      final List<Result> charList = apiList.asData!.value.characters!.results!;
      state = charList;
      initialState = LoadStatus.loaded;
    } catch (e) {
      log(e.toString());
    }
  }

  void searchChar(String name) {
    List<Result> characterList = [...state];
    final searchedList = characterList
        .where((e) => e.name!.toLowerCase().contains(name))
        .toList();
    state = searchedList;
    log(state.toString());
  }
}
