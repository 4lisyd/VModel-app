import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedProvider = ChangeNotifierProvider((ref) {
  return FeedProvider();
});

class FeedProvider extends ChangeNotifier {
  bool isShare = true;
  void isShared() {
    if (isShare) {
      isShare = false;
      notifyListeners();
    } else {
      isShare = true;
      notifyListeners();
    }
  }

  bool isLike = false;
  void isLiked() {
    isLike =!isLike;
    notifyListeners();
    // if (isLike) {
    //   isLike = false;
    //   notifyListeners();
    // }
    // else {
    //   isLike = true;
    //
    // }
  }

  bool isSave = false;
  void isSaved() {
    isSave =!isSave;
    notifyListeners();

  }

  bool isFeed = false;
  void isFeedPage({bool? isFeedOnly}) {
    if (isFeedOnly == false) {
      isFeed = false;
      notifyListeners();
    }
    if (isFeed) {
      isFeed = false;
      notifyListeners();
    } else {
      isFeed = true;
      notifyListeners();
    }
  }
}
