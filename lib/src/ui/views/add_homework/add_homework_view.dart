import 'package:arrowad_grade_eleven/src/app/core/validators/homework_name_validator.dart';
import 'package:arrowad_grade_eleven/src/app/utils/colors.dart';
import 'package:arrowad_grade_eleven/src/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import './add_homework_view_model.dart';

class AddHomeworkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddHomeworkViewModel>.reactive(
      viewModelBuilder: () => AddHomeworkViewModel(),
      onModelReady: (AddHomeworkViewModel model) async {
        await model.init(
          context: context,
        );
      },
      builder: (
        BuildContext context,
        AddHomeworkViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Add New Homework"),
          ),
          body: SafeArea(
            child: Form(
              key: model.addHomeworkFormKey,
              autovalidateMode: model.autoValidate
                  ? AutovalidateMode.onUserInteraction
                  : null,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      model.isBusy
                          ? LinearProgressIndicator()
                          : SizedBox.shrink(),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: model.nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        maxLength: 50,
                        maxLines: 1,
                        validator: (String homeworkName) {
                          return validateHomeworkName(homeworkName);
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomElevatedButton(
                        text: "Add New Homework",
                        color: KColors.orange,
                        icon: FontAwesomeIcons.plusCircle,
                        onTap: () async {
                          await model.addNewHomework();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
