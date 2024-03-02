import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import './schedule_view_model.dart';

@RoutePage()
class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      viewModelBuilder: () => ScheduleViewModel(),
      builder: (
        BuildContext context,
        ScheduleViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Schedule",
            ),
          ),
          body: SafeArea(
            child: SfPdfViewer.network(
              "https://firebasestorage.googleapis.com/v0/b/arrowad-grade-eleven.appspot.com/o/quarter_4_exams_schedule.pdf?alt=media&token=ee66ee84-6069-4eb4-a3ea-8fe4d76d5fb7",
            ),
          ),
        );
      },
    );
  }
}
