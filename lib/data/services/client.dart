import 'package:graphql_flutter/graphql_flutter.dart';

final httpLink = HttpLink("https://rickandmortyapi.com/graphql");

class Client {
  static GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(store: HiveStore(null)),
    link: httpLink,
  );
}
