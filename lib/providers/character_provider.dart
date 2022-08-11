import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/character_model.dart';
import '../data/services/fetch_characters.dart';

final model = Provider((ref) => FetchCharacters());

final characterListProvider = FutureProvider<Data>((ref) {
  final res = ref.watch(model).getCharacter(ref);
  return res;
});
