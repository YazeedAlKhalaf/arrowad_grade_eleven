import 'package:arrowad_grade_eleven/src/app/models/k_homework_item.dart';
import 'package:arrowad_grade_eleven/src/app/utils/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:stacked/stacked.dart';

import './homework_item_info_view_model.dart';

@RoutePage()
class HomeworkItemInfoView extends StatelessWidget {
  final KHomeworkItem homeworkItem;

  const HomeworkItemInfoView({
    Key? key,
    required this.homeworkItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeworkItemInfoViewModel>.reactive(
      viewModelBuilder: () => HomeworkItemInfoViewModel(),
      builder: (
        BuildContext context,
        HomeworkItemInfoViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              homeworkItem.name,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Text(
                    homeworkItem.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Subject: ${homeworkItem.subject}",
                    style: TextStyle(
                      color: KColors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Due on: ${intl.DateFormat("dd MMM").format(homeworkItem.dueDate)}",
                    style: TextStyle(
                      color: KColors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(),
                  Text(
                    homeworkItem.description,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
