import 'package:flutter/material.dart';

import 'formulaire_officier_1/formulaire_officier_1.dart';
import 'formulaire_officier_2/formulaire_officier_2.dart';
import 'formulaire_officier_3/formulaire_officier_3.dart';
import 'formulaire_officier_4/formulaire_officier_4.dart';

class OfficierRapport extends StatelessWidget {
  //
  Map match;
  //
  OfficierRapport(this.match);
  //
  PageController controller = PageController();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      color: Colors.red, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Rapport 4eme Officier"),
            centerTitle: true,
          ),
          body: PageView(
            controller: controller,
            children: [
              FormulaireOffice1(controller),
              FormulaireOffice2(controller),
              FormulaireOffice3(controller),
              FormulaireOffice4(controller),
            ],
          ),
        ),
      ),
    );
  }
}
