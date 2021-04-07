import 'dart:io';

import 'package:arrowad_grade_eleven/src/app/utils/colors.dart';
import 'package:arrowad_grade_eleven/src/app/utils/utils.dart';
import 'package:arrowad_grade_eleven/src/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import './edit_profile_view_model.dart';

class EditProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      viewModelBuilder: () => EditProfileViewModel(),
      onModelReady: (EditProfileViewModel model) async {
        await model.init(
          context: context,
        );
      },
      builder: (
        BuildContext context,
        EditProfileViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Edit Profile",
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: model.editProfileFormKey,
                autovalidateMode: model.autoValidate
                    ? AutovalidateMode.onUserInteraction
                    : null,
                child: Column(
                  children: <Widget>[
                    model.isBusy
                        ? LinearProgressIndicator()
                        : SizedBox.shrink(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: model.pickedImage != null
                              ? FileImage(
                                  model.pickedImage,
                                )
                              : NetworkImage(
                                  model.currentUser.photoUrl ??
                                      "https://firebasestorage.googleapis.com/v0/b/arrowad-grade-eleven.appspot.com/o/placeholder-person.jpg?alt=media&token=c4e35987-16f2-4d48-9f59-8a64dd60bcf6",
                                ),
                          radius: 50,
                        ),
                        TextButton(
                          onPressed: () async {
                            final File image = await Utils.pickImage();

                            if (image != null) {
                              model.setPickedImage(image);
                            }
                          },
                          child: Text(
                            "Change profile image",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: CustomElevatedButton(
                        text: "Update Profile",
                        icon: FontAwesomeIcons.upload,
                        color: KColors.orange,
                        onTap: () async {
                          await model.updateUser();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
