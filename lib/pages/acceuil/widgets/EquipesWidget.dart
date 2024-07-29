import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/loader.dart';
import '../../../utils/requete.dart';
import '../../../controllers/EquipeController.dart';

class EquipesWidget extends GetView<EquipeController> {
  EquipesWidget() {
    //
    controller.getAllEquipes();
  }
  RxString mot = "".obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        child: controller.obx(
              (state) {
            RxList equipes = RxList(state as List);
            return Column(
              children: [
                Expanded(
                  child: Obx(
                        () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: equipes.length,
                      itemBuilder: (context, index) {
                        Map equipe = equipes[index];
                        if ("${equipe['nom']}".contains(mot.value)) {
                          return Container(
                            width: MediaQuery.of(context).size.height * 0.07,
                            margin: const EdgeInsets.symmetric(horizontal: 7),
                            decoration: BoxDecoration(
                              color: Color(0xFFE9E6E6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.height * 0.06,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    // Ajout du CircularProgressIndicator dans le BoxDecoration
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "${Requete.url}/equipe/logo/${equipe['id']}",
                                      ),
                                      fit: BoxFit.contain,
                                      // Ajout du CircularProgressIndicator à l'intérieur de l'image
                                      alignment: Alignment.center,
                                      onError: (_, __) => Center(
                                        child: Loader.loadingW(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          },
          onEmpty: Container(),
          onError: (error) {
            return const Center(
              child: Text("Une erreur c'est produite lors du chargement des informations"),
            );
          },
          onLoading: Loader.loadingW(),
        ),
      ),
    );
  }
}