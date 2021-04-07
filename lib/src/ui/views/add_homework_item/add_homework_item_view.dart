import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import 'package:arrowad_grade_eleven/src/app/core/validators/homework_item_description_validator.dart';
import 'package:arrowad_grade_eleven/src/app/core/validators/homework_item_name_validator.dart';
import 'package:arrowad_grade_eleven/src/app/core/validators/homework_item_subject_validator.dart';
import 'package:arrowad_grade_eleven/src/app/utils/colors.dart';
import 'package:arrowad_grade_eleven/src/ui/widgets/custom_elevated_button.dart';

import './add_homework_item_view_model.dart';

class AddHomeworkItemView extends StatelessWidget {
  final String homeworkId;

  const AddHomeworkItemView({
    Key key,
    @required this.homeworkId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddHomeworkItemViewModel>.reactive(
      viewModelBuilder: () => AddHomeworkItemViewModel(),
      onModelReady: (AddHomeworkItemViewModel model) async {
        await model.init(
          context: context,
          homeworkId: homeworkId,
        );
      },
      builder: (
        BuildContext context,
        AddHomeworkItemViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Add Homework Item",
            ),
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
                          return validateHomeworkItemName(homeworkName);
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: model.descriptionController,
                        decoration: InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        maxLength: 150,
                        maxLines: 3,
                        validator: (String description) {
                          return validateHomeworkItemDescription(description);
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField(
                        value: model.subjectDropdown,
                        items: model.subjects
                            .map<DropdownMenuItem<String>>((String subject) {
                          return DropdownMenuItem<String>(
                            value: subject,
                            child: Text(
                              subject,
                            ),
                          );
                        }).toList(),
                        onChanged: model.setSubjectDropdown,
                        decoration: InputDecoration(
                          labelText: "Subject",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (String subject) {
                          return validateHomeworkItemSubject(subject);
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomElevatedButton(
                        text: "Add New Homework Item",
                        color: KColors.orange,
                        icon: FontAwesomeIcons.plusCircle,
                        onTap: () async {
                          await model.addNewHomeworkItem();
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
