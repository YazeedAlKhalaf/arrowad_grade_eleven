import 'package:arrowad_grade_eleven/src/app/utils/colors.dart';
import 'package:arrowad_grade_eleven/src/app/utils/utils.dart';
import 'package:arrowad_grade_eleven/src/ui/widgets/custom_elevated_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import './teacher_info_view_model.dart';

class TeacherInfoView extends StatelessWidget {
  final String id;

  const TeacherInfoView({
    Key key,
    @PathParam('id') @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherInfoViewModel>.reactive(
      viewModelBuilder: () => TeacherInfoViewModel(),
      onModelReady: (TeacherInfoViewModel model) async {
        await model.init(
          context: context,
          teacherId: id,
        );
      },
      builder: (
        BuildContext context,
        TeacherInfoViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(model.teacher != null
                ? "${model.teacher.firstName} ${model.teacher.lastName}"
                : ""),
          ),
          body: model.teacher != null
              ? SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 55,
                                      backgroundColor: KColors.green,
                                    ),
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                        model.teacher.photoUrl,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "${model.teacher.firstName} ${model.teacher.lastName}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "${model.teacher.subject} teacher",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SelectableText(
                                      model.teacher.phoneNumber,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomElevatedButton(
                                text: "Call Teacher",
                                color: KColors.green,
                                icon: Icons.call,
                                onTap: () async {
                                  await Utils.launchPhoneNumber(
                                    phoneNumber: model.teacher.phoneNumber,
                                  );
                                  print(
                                    "Calling teacher with number: ${model.teacher.phoneNumber}",
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomElevatedButton(
                                text: "Whatsapp Teacher",
                                color: KColors.green,
                                icon: FontAwesomeIcons.whatsapp,
                                onTap: () async {
                                  await Utils.launchPhoneNumberInWhatsapp(
                                    phoneNumber: model.teacher.phoneNumber,
                                  );
                                  print(
                                    "Whatsapping teacher with number: ${model.teacher.phoneNumber}",
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
