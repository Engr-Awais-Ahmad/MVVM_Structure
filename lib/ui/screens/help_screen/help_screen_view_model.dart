import 'package:flutter/material.dart';

class HelpScreenViewModel with ChangeNotifier {
  void onMessageTap() {
    // handle message us action
    debugPrint("Message button tapped");
  }

  void onEmailTap() {
    // handle email us action
    debugPrint("Email button tapped");
  }
}
