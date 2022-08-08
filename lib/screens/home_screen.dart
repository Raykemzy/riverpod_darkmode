// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_darkmode/providers/theme_mode_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var r = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Theme Toggle'),
      ),
      body: Center(
        child: CupertinoSwitch(
          value: r,
          onChanged: (value) {
            ref.read(themeModeProvider.notifier).toggleTheme(value);
          },
        ),
      ),
    );
  }
}
