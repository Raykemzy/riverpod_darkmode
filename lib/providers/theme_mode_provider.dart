import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeNotifier, bool>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false);
  final bool _isDark = false;
  bool get isDark => _isDark;

  toggleTheme(bool value) {
    state = value;
  }
}
