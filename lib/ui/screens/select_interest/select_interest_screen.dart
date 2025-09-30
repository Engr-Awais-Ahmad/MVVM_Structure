import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_app/core/constant/auth_field_decoration.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/constant/text_style.dart';
import 'package:mvvm_app/ui/custom_widgets/custom_interests_button.dart';
import 'package:mvvm_app/ui/screens/select_interest/select_interest_view_model.dart.dart';
import 'package:provider/provider.dart';

class SelectInterestScreen extends StatelessWidget {
  const SelectInterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectInterestViewModel(),
      child: Consumer<SelectInterestViewModel>(
        builder: (context, model, child) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("$staticAssets/app_logo.png", scale: 6),
                  20.verticalSpace,
                  Text("Select Your Interests", style: style24),
                  Text(
                    "Select your top 5 Interests to Start your Savo journey",
                    style: style16.copyWith(fontSize: 14, color: greyColor),
                  ),
                  30.verticalSpace,
                  TextFormField(
                    onChanged: (value) =>
                        model.setSearchQuery(value), // 👈 filter trigger
                    style: style16,
                    controller: model.searchController,
                    decoration: searchFieldDecoration.copyWith(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search, color: greyColor),
                    ),
                  ),
                  30.verticalSpace,
                  Wrap(
                    children: List.generate(
                      model.selectedInterests.length,
                      (index) => CustomInterestButton(
                        text:
                            " ${model.selectedInterests[index]}", // number wise
                        index: index,
                        onTap: () {
                          model.onClick(
                            model.selectedInterests[index],
                          ); // deselect
                        },
                        isSelected: true, // upar wale hamesha selected
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  Text("Select Interests", style: style16),
                  30.verticalSpace,
                  Wrap(
                    children: List.generate(
                      model.filteredInterests.length,
                      (index) => CustomInterestButton(
                        text: model.filteredInterests[index],
                        onTap: () {
                          model.onClick(model.interests[index]); // select
                        },
                        isSelected: false, // neeche wale default not selected
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
