import 'package:flutter/material.dart';

class Butteurs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      children: List.generate(20, (index) {
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
                flex: 7,
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
                  "${index + 1}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              //
            ],
          ),
        );
      }),
    );
  }
}
