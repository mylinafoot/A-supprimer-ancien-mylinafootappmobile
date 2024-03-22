import 'package:flutter/material.dart';
import 'package:linafoot/pages/statistique/classement/playoff/playoff.dart';

import 'classique/classique.dart';
import 'playdown/playdown.dart';

class Classement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Column(
        //padding: EdgeInsets.only(left: 0, right: 0, top: 0),
        children: [
          Container(
            height: 50,
            color: Colors.blue.shade100.withOpacity(0.3),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SAISON ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                Text(
                  "2023/2024",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                //color: Colors.white,
                fontSize: 10,
              ),
              tabs: [
                Tab(
                  text: "Classique",
                ),
                Tab(
                  text: "Playoff",
                ),
                Tab(
                  text: "Playdown",
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                Classique(),
                Playoff(),
                Playdown(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
