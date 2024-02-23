import 'package:flutter/material.dart';

import 'formulaire_com_1/formulaire_com_1.dart';
import 'formulaire_com_2/formulaire_com_2.dart';
import 'formulaire_com_3/formulaire_com_3.dart';
import 'formulaire_com_4/formulaire_com_4.dart';
import 'formulaire_com_5/formulaire_com_5.dart';
import 'formulaire_com_6/formulaire_com_6.dart';
import 'formulaire_com_7/formulaire_com_7.dart';

class CommissaireFormulaire extends StatelessWidget {
  //
  Map match;
  //
  CommissaireFormulaire(this.match);
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
            title: const Text("Rapport commissaire"),
            centerTitle: true,
          ),
          body: PageView(
            controller: controller,
            children: [
              FormulaireCom1(controller, match),
              FormulaireCom2(controller),
              FormulaireCom3(controller),
              FormulaireCom4(controller),
              FormulaireCom5(controller),
              FormulaireCom6(controller),
              FormulaireCom7(controller, match),
            ],
          ),
        ),
      ),
    );
  }
}
