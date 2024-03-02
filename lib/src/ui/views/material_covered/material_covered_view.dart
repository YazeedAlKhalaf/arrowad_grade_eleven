import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import './material_covered_view_model.dart';

@RoutePage()
class MaterialCoveredView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MaterialCoveredViewModel>.reactive(
      viewModelBuilder: () => MaterialCoveredViewModel(),
      builder: (
        BuildContext context,
        MaterialCoveredViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Material Covered",
            ),
          ),
          body: SafeArea(
            child: FutureBuilder<String>(
              future: model.getPdfUrl(),
              builder: (
                BuildContext context,
                AsyncSnapshot<String> snapshot,
              ) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Oops! Internet Issue!",
                    ),
                  );
                }

                if (snapshot.hasData) {
                  final String pdfUrl = snapshot.data;
                  return SfPdfViewer.network(pdfUrl);
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
