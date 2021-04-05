import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './register_view_model.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (
        BuildContext context,
        RegisterViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'RegisterView',
            ),
          ),
        );
      },
    );
  }
}
