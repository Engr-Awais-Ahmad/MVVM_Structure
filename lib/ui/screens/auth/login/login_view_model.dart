import 'package:mvvm_app/core/view_model/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  bool isSelect = true;

  onClick() {
    isSelect = !isSelect;
    notifyListeners();
  }
}
