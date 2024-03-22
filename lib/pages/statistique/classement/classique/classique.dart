import 'package:flutter/material.dart';

class Classique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
      length: 50,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 10,
              ),
              tabs: List.generate(
                50,
                (index) {
                  return Tab(
                    text: "J ${index + 1}",
                  );
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  " #  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
                Expanded(
                  flex: 3,
                  child: Text("Equipe"),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "MJ ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "MG ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "MP ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                //
                Expanded(
                  flex: 1,
                  child: Text(
                    "MN ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "BP ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "BC  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "DIFF ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "PTS  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: List.generate(
                50,
                (index) {
                  return ListView(
                    children: List.generate(20, (index) {
                      return Container();
                      return Container(
                        padding: EdgeInsets.all(0),
                        color: index < 8
                            ? Colors.green.shade100.withOpacity(0.2)
                            : index > 17
                                ? Colors.red.shade100.withOpacity(0.4)
                                : Colors.orange.shade100.withOpacity(0.2),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              " ${index + 1}  ",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Image.asset(
                              "assets/AS DAUPHIN NOIR.png",
                              width: 25,
                              height: 25,
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 20),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Fc L'shi sport ",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${index + 1} ",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${index + 1} ",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${index + 1}",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            //
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${index + 1} ",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${index + 1} ",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${index + 1}",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${index + 1} ",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${index + 1}",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
