import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_darkmode/providers/light_providers.dart';

import '../../data/models/character_model.dart';

class SearchBar extends StatelessWidget {
  final List<Result> charList;
  const SearchBar({Key? key, required this.charList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        width: 250,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Consumer(builder: (context, ref, child) {
            return TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                ref.read(characters.notifier).searchChar(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
            );
          }),
        ),
      ),
    );
  }
}
