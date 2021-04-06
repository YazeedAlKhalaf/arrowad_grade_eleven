import 'package:arrowad_grade_eleven/src/app/models/k_homework_item.dart';
import 'package:arrowad_grade_eleven/src/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:stacked/stacked.dart';

import 'package:arrowad_grade_eleven/src/app/models/k_homework.dart';

import './homework_items_view_model.dart';

class HomeworkItemsView extends StatelessWidget {
  final KHomework homework;

  const HomeworkItemsView({
    Key key,
    @required this.homework,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeworkItemsViewModel>.reactive(
      viewModelBuilder: () => HomeworkItemsViewModel(),
      builder: (
        BuildContext context,
        HomeworkItemsViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              homework.name,
            ),
          ),
          body: SafeArea(
            child: ListView.builder(
              itemCount: homework.homeworkItems.length,
              itemBuilder: (BuildContext context, int index) {
                final KHomeworkItem homeworkItem =
                    homework.homeworkItems[index];

                return ListTile(
                  isThreeLine: true,
                  title: Text(
                    homeworkItem.name.length > 25
                        ? "${homeworkItem.name.substring(0, 25)}..."
                        : homeworkItem.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        homeworkItem.description.length > 30
                            ? "${homeworkItem.description.substring(0, 30)}..."
                            : homeworkItem.description,
                      ),
                      Text(
                        "Due on: ${intl.DateFormat("dd MMM, yyyy").format(homeworkItem.dueDate)}",
                        style: TextStyle(
                          color: KColors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: Text(
                    homeworkItem.subject,
                    style: TextStyle(
                      color: KColors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        );
      },
    );
  }
}
