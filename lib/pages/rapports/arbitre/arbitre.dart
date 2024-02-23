import 'package:flutter/material.dart';

import 'formulaire_arb_1/formulaire_arb_1.dart';
import 'formulaire_arb_2/formulaire_arb_2.dart';
import 'formulaire_arb_3/formulaire_arb_3.dart';
import 'formulaire_arb_33/formulaire_arb_33.dart';
import 'formulaire_arb_33/formulaire_arb_333.dart';
import 'formulaire_arb_4/formulaire_arb_4.dart';
import 'formulaire_arb_5/formulaire_arb_5.dart';
import 'formulaire_arb_6/formulaire_arb_6.dart';
import 'formulaire_arb_7/formulaire_arb_7.dart';

class HarbitreRapport extends StatelessWidget {
  //
  Map match;
  //
  HarbitreRapport(this.match);
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
            title: const Text("Rapport arbitre centrale"),
            centerTitle: true,
          ),
          body: PageView(
            controller: controller,
            children: [
              FormulaireArb1(controller),
              FormulaireArb2(controller),
              FormulaireArb3(controller),
              FormulaireArb33(controller),
              FormulaireArb333(controller),
              FormulaireArb4(controller),
              FormulaireArb5(controller),
              FormulaireArb6(controller),
              FormulaireArb7(controller),
            ],
          ),
        ),
      ),
    );
  }
}
