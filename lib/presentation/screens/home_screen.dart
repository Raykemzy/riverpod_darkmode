// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_darkmode/providers/light_providers.dart';
import 'package:riverpod_darkmode/providers/theme_mode_provider.dart';
import 'package:riverpod_darkmode/utils/enums/state_enums.dart';

import '../widgets/search_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final r = ref.watch(themeModeProvider);
    final characterList = ref.watch(characters);
    final charModel = ref.watch(characters.notifier);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Hi there'),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: Colors.red),
            ),
            actions: [
              CupertinoSwitch(
                  value: r,
                  onChanged: (v) =>
                      ref.read(themeModeProvider.notifier).toggleTheme(v))
            ],
          ),
          (charModel.initialState == LoadStatus.loading)
              ? const SliverToBoxAdapter(
                  child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(child: CircularProgressIndicator()),
                ))
              : SliverToBoxAdapter(
                  child: Expanded(
                    child: Column(
                      children: [
                        SearchBar(
                          charList: characterList,
                        ),
                        SizedBox(
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: characterList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  (orientation == Orientation.portrait) ? 2 : 3,
                            ),
                            itemBuilder: (context, index) {
                              final name = characterList[index].name;
                              final image = characterList[index].image;
                              return Card(
                                child: GridTile(
                                  footer: Text(name!),
                                  child: Image.network(
                                      image!), //just for testing, will fill with image later
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
