import 'package:flutter/material.dart';

import 'poolA/poola.dart';
import 'poolB/poolb.dart';

class Playdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              tabs: List.generate(
                2,
                (index) {
                  return Tab(
                    text: "Pool ${index + 1}",
                  );
                },
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(right: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Text(
          //         " #  ",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       SizedBox(
          //         width: 40,
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(left: 20),
          //       ),
          //       Expanded(
          //         flex: 9,
          //         child: Text("Equipe"),
          //       ),
          //       Expanded(
          //         flex: 1,
          //         child: Text(
          //           "P ",
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 10,
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         flex: 1,
          //         child: Text(
          //           "M ",
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 10,
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         flex: 1,
          //         child: Text(
          //           "GD  ",
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 10,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                PoolA(),
                PoolB(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
