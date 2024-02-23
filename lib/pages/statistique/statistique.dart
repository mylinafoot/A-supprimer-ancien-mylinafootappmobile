import 'package:flutter/material.dart';

import '../actus/actus.dart';
import 'butteurs/butteurs.dart';
import 'classement/classement.dart';

class Statistique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      //color: Colors.red, // Status bar color
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [
      //       Colors.black,
      //       Colors.black,
      //       Colors.black,
      //       Colors.black,
      //       Colors.black,
      //     ],
      //   ),
      // ),
      child: DefaultTabController(
        length: 5,
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Scaffold(
            body: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: TabBar(
                    tabAlignment: TabAlignment.center,
                    isScrollable: true,
                    labelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(
                        text: "Equipes",
                      ),
                      Tab(
                        text: "Butteurs",
                      ),
                      Tab(
                        text: "Passeurs",
                      ),
                      Tab(
                        text: "Cartons",
                      ),
                      Tab(
                        text: "Stats",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TabBarView(
                    children: [
                      Classement(),
                      Butteurs(),
                      Container(),
                      Container(),
                      Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
