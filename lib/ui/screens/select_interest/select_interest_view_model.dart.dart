import 'package:mvvm_app/core/view_model/base_view_model.dart';

class SelectInterestViewModel extends BaseViewModel {
  List<String> interests = [
    "Purchasing a Home",
    "Real Estate",
    "Stocks",
    "Selling a Home",
    "Investment Property",
    "Debt",
    "Credit",
    "Insurance",
    "Loans",
    "Budgeting",
    "Mortgages",
    "Taxes",
    "Starting your own business",
    "Credit Cards",
  ];

  List<String> selectedInterests = [];

  void onClick(int index) {
    String interest = interests[index];

    if (selectedInterests.contains(interest)) {
      // remove if already selected
      selectedInterests.remove(interest);
    } else {
      // add new selection at the beginning
      selectedInterests.insert(0, interest);
    }
    notifyListeners();
  }

  bool isSelected(String interest) {
    return selectedInterests.contains(interest);
  }

  // merged list = selected first + remaining
  List<String> get orderedInterests {
    final remaining = interests.where((e) => !selectedInterests.contains(e));
    return [...selectedInterests, ...remaining];
  }
}
