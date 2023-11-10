import 'package:flutter/cupertino.dart';

class FavouriteProvider extends ChangeNotifier{
  List<String> _words = [];
  List <String> get words => _words;

  void toggleFavourite(String word){
    final isExist = _words.contains(word);
    if(isExist){
      _words.remove(word);
    }else{
      words.add(word);
    }
    notifyListeners();
  }

  bool isExist(String word){
    final isExist = _words.contains(word);
    return isExist;
  }
  void clearFavourite(){
    _words = [];
    notifyListeners();
  }
}