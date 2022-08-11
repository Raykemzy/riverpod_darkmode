import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:riverpod_darkmode/data/services/client.dart';

import '../../providers/light_providers.dart';
import '../models/character_model.dart';

class FetchCharacters {
  final client = Client.client;
  Future<Data> getCharacter(Ref ref) async {
    QueryResult result = await client.query(
      QueryOptions(
        document: gql(ref.watch(characterProvider)),
      ),
    );

    log('${result.data}');
    Data char = Data.fromJson(result.data!);

    log(char.toString());
    return char;
  }
}
