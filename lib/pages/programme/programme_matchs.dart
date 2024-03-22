import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'programme_controller.dart';
import 'programme_journee.dart';

class ProgrammeMatchs extends StatelessWidget {
  //
  ProgrammeController programmeController = Get.find();
  //
  RxInt jr = 0.obs;
  String idCalendrier, categorie;
  //
  ProgrammeMatchs(this.idCalendrier, this.categorie) {
    load();
    //jr++;
  }
  //
  load() async {
    List l = await programmeController.getAllJourneeDeLaSaison(
        idCalendrier, categorie);
    jr.value = l.isEmpty ? 1 : l.length;
    //
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    return Obx(
      () => DefaultTabController(
        length: jr.value,
        initialIndex: programmeController.journee.value - 1,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
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
                  tabs: List.generate(
                    jr.value,
                    (index) => Tab(
                      text: "Jr ${index + 1}",
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TabBarView(
                  children: List.generate(
                    jr.value,
                    (e) {
                      print("response jr $e");
                      return ProgrammeJournee(
                        idCalendrier,
                        categorie,
                        e + 1,
                        key: UniqueKey(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //
}
