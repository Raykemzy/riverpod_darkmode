import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_darkmode/utils/enums/state_enums.dart';

import '../data/models/character_model.dart';
import '../logic/character_notifier.dart';

final characterProvider = Provider<String>((ref) {
  const String readCharacters = """
    query {
      characters() {
        results {
          name
          image
        }
      }
    }
""";
  return readCharacters;
});

final statusProvider = StateProvider((ref) => LoadStatus.loading);

final characters = StateNotifierProvider<CharacterNotifier, List<Result>>(
  (ref) => CharacterNotifier(ref),
);
