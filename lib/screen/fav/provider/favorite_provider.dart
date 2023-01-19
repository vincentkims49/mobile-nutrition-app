import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _food = [];
  List<String> get words => _food;

  void toggleFavorite(String word) {
    final isExist = _food.contains(word);
    if (isExist) {
      _food.remove(word);
    } else {
      _food.add(word);
    }
    notifyListeners();
  }

  bool isExist(String word) {
    final isExist = _food.contains(word);
    return isExist;
  }

  void clearFavorite() {
    _food = [];
    notifyListeners();
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
