import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart' as intl;

import 'package:arrowad_grade_eleven/src/app/models/k_teacher.dart';
import 'package:arrowad_grade_eleven/src/app/utils/colors.dart';
import 'package:arrowad_grade_eleven/src/ui/widgets/custom_elevated_button.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (HomeViewModel model) async {
        await model.init(
          context: context,
        );
      },
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget child,
      ) {
        Widget _buildDrawerRow() {
          return Builder(
            builder: (BuildContext context) {
              return Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu_rounded,
                      size: 35,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ],
              );
            },
          );
        }

        Widget _buildNameRow() {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  "Welcome ${model.currentUser.firstName},",
                  style: TextStyle(
                    fontFamily: "Agency FB",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }

        Widget _buildHomework() {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                await model.navigateToHomeworkView();
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: KColors.orange,
                          width: 5,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "Homework",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.home,
                                  color: KColors.orange,
                                  size: 75,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Life is a blanket!",
                                      style: TextStyle(
                                        color: KColors.orange,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      intl.DateFormat("dd MMM,yyyy")
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                        color: KColors.orange,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "learn more ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        Widget _buildTeachers() {
          return Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Teachers",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () async {
                              await model.navigateToTeacherListView();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "see more ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
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
                  ],
                ),
              ),
            ],
          );
        }

        Widget _buildExtras() {
          return Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Extras",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          CustomElevatedButton(
                            text: "Schedule",
                            icon: Icons.schedule,
                            color: KColors.purple,
                            onTap: () async {
                              await model.navigateToScheduleView();
                            },
                          ),
                          CustomElevatedButton(
                            text: "Material Covered",
                            iconPath: "assets/icons/material_icon.png",
                            color: KColors.blue,
                            onTap: () async {
                              await model.navigateToMaterialCoveredView();
                            },
                          ),
                          CustomElevatedButton(
                            text: "Tips",
                            iconPath: "assets/icons/tips_icon.png",
                            color: KColors.yellow,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        Widget _buildTile({
          @required String text,
          @required IconData iconData,
          Color color,
          @required void Function() onTap,
        }) {
          return ListTile(
            leading: Icon(
              iconData,
              color: color ?? null,
            ),
            title: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: onTap,
          );
        }

        Widget _buildDrawer() {
          return Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    "${model.currentUser.firstName} ${model.currentUser.lastName} - S${model.currentUser.sNumber}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  accountEmail: Text(
                    "${model.currentUser.phoneNumber}",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                      model.currentUser.photoUrl ??
                          "https://firebasestorage.googleapis.com/v0/b/arrowad-grade-eleven.appspot.com/o/placeholder-person.jpg?alt=media&token=c4e35987-16f2-4d48-9f59-8a64dd60bcf6",
                    ),
                  ),
                ),
                _buildTile(
                  text: "Edit Profile",
                  iconData: FontAwesomeIcons.userEdit,
                  onTap: () async {
                    await model.navigateToEditProfileView();
                  },
                ),
                _buildTile(
                  text: "Sign Out",
                  iconData: FontAwesomeIcons.signOutAlt,
                  color: Colors.red,
                  onTap: () async {
                    await model.signOut();
                  },
                ),
              ],
            ),
          );
        }

        return Scaffold(
          drawer: _buildDrawer(),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                await model.init(
                  context: context,
                );
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildDrawerRow(),
                    _buildNameRow(),
                    _buildHomework(),
                    const SizedBox(height: 10),
                    _buildTeachers(),
                    const SizedBox(height: 10),
                    _buildExtras(),
                    const SizedBox(height: 10),
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
