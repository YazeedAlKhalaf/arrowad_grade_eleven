import 'package:arrowad_grade_eleven/src/app/models/k_teacher.dart';
import 'package:arrowad_grade_eleven/src/app/utils/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './teacher_list_view_model.dart';

@RoutePage()
class TeacherListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherListViewModel>.reactive(
      viewModelBuilder: () => TeacherListViewModel(),
      onModelReady: (TeacherListViewModel model) async {
        await model.init(
          context: context,
        );
      },
      builder: (
        BuildContext context,
        TeacherListViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Teachers",
            ),
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                await model.init(
                  context: context,
                );
              },
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.3,
                ),
                physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                itemCount: model.teachersList.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  final KTeacher teacher = model.teachersList[index];

                  return InkWell(
                    onTap: () async {
                      await model.navigateToTeacherView(
                        teacherId: teacher.id,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: KColors.green,
                              ),
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  teacher.photoUrl,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${teacher.firstName}\n${teacher.lastName}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
