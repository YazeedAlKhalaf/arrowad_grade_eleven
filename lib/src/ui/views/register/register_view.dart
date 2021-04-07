import 'package:arrowad_grade_eleven/src/app/core/validators/name_validator.dart';
import 'package:arrowad_grade_eleven/src/app/core/validators/phone_number_validator.dart';
import 'package:arrowad_grade_eleven/src/app/core/validators/s_number_validator.dart';
import 'package:arrowad_grade_eleven/src/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  model.isBusy ? LinearProgressIndicator() : SizedBox.shrink(),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Form(
                      key: model.registerFormKey,
                      autovalidateMode: model.autoValidate
                          ? AutovalidateMode.onUserInteraction
                          : null,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  controller: model.firstNameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: "First Name",
                                  ),
                                  validator: (String firstName) {
                                    return validateName(firstName, true);
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: model.lastNameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: "Last Name",
                                  ),
                                  validator: (String lastName) {
                                    return validateName(lastName, false);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: model.sNumberController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "S-Number",
                              prefixText: "S",
                            ),
                            maxLength: 6,
                            validator: (String sNumber) {
                              return validateSNumber(sNumber);
                            },
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: model.phoneNumberController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: "Phone Number",
                            ),
                            validator: (String phoneNumber) {
                              return validatePhoneNumber(phoneNumber);
                            },
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await model.registerUser(
                                      context: context,
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      await model.navigateToLoginView();
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Already have an account? Login!",
                        style: TextStyle(
                          color: KColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
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
