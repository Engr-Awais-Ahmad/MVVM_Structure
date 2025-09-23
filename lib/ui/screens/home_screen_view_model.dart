import 'package:mvvm_app/core/view_model/base_view_model.dart';

class HomeScreenViewModel extends BaseViewModel {
  bool isLiked = false;

  void toggleLike() {
    isLiked = !isLiked;
    notifyListeners();
  }
}
