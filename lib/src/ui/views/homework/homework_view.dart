import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' as intl;
import 'package:stacked/stacked.dart';

import 'package:arrowad_grade_eleven/src/app/models/k_homework.dart';

import './homework_view_model.dart';

class HomeworkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeworkViewModel>.reactive(
      viewModelBuilder: () => HomeworkViewModel(),
      onModelReady: (HomeworkViewModel model) async {
        await model.init(
          context: context,
        );
      },
      builder: (
        BuildContext context,
        HomeworkViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Homework",
            ),
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                await model.getAllHomework();
              },
              child: ListView.builder(
                itemCount: model.homeworkList.length,
                physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                itemBuilder: (BuildContext context, int index) {
                  final KHomework homework = model.homeworkList[index];
                  final DateTime homeworkCreatedAt =
                      homework.createdAt.toDate();

                  return ListTile(
                    title: Text(
                      homework.name,
                    ),
                    subtitle: Text(
                      "${intl.DateFormat("dd MMM, yyyy").format(homeworkCreatedAt)}",
                    ),
                    onTap: () async {
                      await model.navigateToHomeworkItemsView(
                        homework: homework,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          floatingActionButton: model.currentUser.isAdmin
              ? FloatingActionButton(
                  onPressed: () async {
                    await model.navigateToAddHomeworkView();
                  },
                  child: Icon(
                    FontAwesomeIcons.plus,
                  ),
                )
              : null,
        );
      },
    );
  }
}
