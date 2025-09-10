import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/ui/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(Object context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          body: GestureDetector(
            onTap: () {
              model.onClick();
            },
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                color: model.isSelect ? Colors.green : Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
