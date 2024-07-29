import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/loader.dart';
import 'AfficheProgrammeWidget.dart';
import '../../programme/programme_controller.dart';

class ProgrammesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _Entree();
  }
}

class _Entree extends State<ProgrammesWidget> {
  //
  ProgrammeController programmeController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.only(
                top: 5,
                left: 30,
                right: 30,
                bottom: 0,
              ),
              child: FutureBuilder(
                future: programmeController.getCalendrier(),
                builder: (c, t) {
                  //
                  if (t.hasData) {
                    var id = t.data as int;
                    print("id: $id");
                    return AfficheProgrammeWidget("$id");
                  } else if (t.hasError) {
                    return Container();
                  }
                  return Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Loader.loadingW(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
