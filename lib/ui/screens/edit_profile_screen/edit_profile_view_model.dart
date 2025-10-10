import 'package:flutter/material.dart';

class EditProfileViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController(
    text: 'Selena Grande',
  );
  final TextEditingController emailController = TextEditingController(
    text: 'selenagrande123@mail.com',
  );
  String dob = '26 Apr, 1990';

  void onBack(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990, 4, 26),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      dob =
          "${picked.day.toString().padLeft(2, '0')} ${_getMonthName(picked.month)}, ${picked.year}";
      notifyListeners();
    }
  }

  void onCoverPhotoTap() {}

  void onProfileImageTap() {}

  void onSave() {}

  String _getMonthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[month - 1];
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
