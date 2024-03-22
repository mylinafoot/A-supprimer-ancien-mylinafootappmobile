import 'package:flutter/material.dart';

class PoolB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              tabs: List.generate(
                5,
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
                    "MJ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "MG",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "MP",
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
                    "MN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "BP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "BC",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "DIFF",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "PTS",
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
                5,
                (index) {
                  return Container();
                  return ListView(
                    children: List.generate(6, (index) {
                      return Container(
                        padding: EdgeInsets.all(0),
                        color: index > 3
                            ? Colors.red.shade400.withOpacity(0.5)
                            : Colors.transparent,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              " ${index + 1}  ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset(
                              "assets/AS DAUPHIN NOIR.png",
                              width: 25,
                              height: 25,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "AS DAUPHIN NOIR",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                                //style: Theme.of(context).textTheme.labelSmall,
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
