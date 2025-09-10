import 'package:mvvm_app/core/view_model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  bool isSelect = false;

  onClick() {
    isSelect = !isSelect;
    notifyListeners();
  }
}
