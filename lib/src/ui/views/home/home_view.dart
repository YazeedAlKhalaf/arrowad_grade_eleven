import 'package:arrowad_grade_eleven/src/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
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
                                "learn more",
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

        Widget _buildDrawer() {
          return Drawer();
        }

        return Scaffold(
          drawer: _buildDrawer(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildDrawerRow(),
                  _buildNameRow(),

                  // TODO: what's for tomorrow
                  _buildWhatsForTomorrow(),

                  // TODO: teachers

                  // TODO: extras
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
