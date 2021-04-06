import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
                    color: KColors.blackBlue,
                    fontFamily: "Agency FB",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }

        Widget _buildWhatsForTomorrow() {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: KColors.orange,
                        width: 2,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "What's for tomorrow",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.edit,
                                color: KColors.orange,
                                size: 75,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "English",
                                    style: TextStyle(
                                      color: KColors.orange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Sunday | 18 Apr",
                                    style: TextStyle(
                                      color: KColors.orange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "12:30 PM - 2:30 PM",
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
                          const SizedBox(height: 20),
                          Row(
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
                    _buildWhatsForTomorrow(),
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
