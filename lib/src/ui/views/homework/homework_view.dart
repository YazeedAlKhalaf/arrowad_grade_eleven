import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

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
            child: Text(
              'HomeworkView',
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await model.navigateToAddHomeworkView();
            },
            child: Icon(
              FontAwesomeIcons.plus,
            ),
          ),
        );
      },
    );
  }
}
