import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre_controller.dart';
import 'package:linafoot/pages/rapports/commissaire/commissaire.dart';
import 'package:linafoot/pages/rapports/officier/officier.dart';
import 'package:linafoot/pages/rapports/officier/officier_controller.dart';
import 'package:linafoot/pages/rapports/rapport_controller.dart';
import 'package:linafoot/utils/loader.dart';
import 'package:linafoot/utils/requete.dart';

import '../rapports/commissaire/commissaire_controller.dart';
import 'profile_controller.dart';

class Profile extends StatelessWidget {
  List matchs = [];
  //
  ProfilController profilController = ProfilController();
  //
  var box = GetStorage();
  //
  CommissaireController commissaireController = Get.find();
  ArbitreController arbitreController = Get.find();
  OfficierController officierController = Get.find();
  //
  int type;
  Profile(this.matchs, this.type);
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: List.generate(
          matchs.length,
          (index) {
            Map match = matchs[index];
            print("match:: $match");
            //
            Map mt = box.read("match${match['match']}") ?? {};
            if (mt['commissaire'] != null) {
              match['jouer'] = mt['jouer'];
            }
            //
            List ds = match['date'].split("-");
            //
            DateTime date =
                DateTime(int.parse(ds[2]), int.parse(ds[1]), int.parse(ds[0]));
            //
            var d = DateFormat.yMMMEd().format(date);
            //
            return Card(
              //color: Colors.white,
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 175,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: InkWell(
                        onTap: () async {
                          //
                          if (!match['jouer']) {
                            //
                            box.write("match${match['match']}", match);
                            //

                            print("rapport: $type: $match");
                            //
                            if (type == 1) {
                              Loader.loading();
                              //
                              bool v = await getInfos(match);
                              Get.to(CommissaireFormulaire(match, 1));
                            } else if (type == 2) {
                              Loader.loading();
                              //
                              bool v = await getInfosAr(match);
                              Get.to(HarbitreRapport(match, 1));
                            } else if (type == 3) {
                              Loader.loading();
                              //
                              bool v = await getInfosOf(match);
                              Get.to(OfficierRapport(match, 1));
                            }
                          } else {
                            //
                            Get.snackbar(
                                "Erreur", "Ce match a déjà été rapporté");
                          }
                          //Get.to();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        //color: Colors.red,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "${Requete.url}/equipe/logo/${match['idEquipeA']}"),
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${match['nomEquipeB']}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "JOURNEE ${match['journee']}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow.shade700,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "$d ${match['date']}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${match['stade']}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "linafoot",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 5,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow.shade700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        //color: Colors.red,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "${Requete.url}/equipe/logo/${match['idEquipeB']}"),
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${match['nomEquipeB']}", //nomEquipeA
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.red.shade900,
                    ),
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () async {
                          //
                          Map rapport =
                              box.read("rapport${match['match']}") ?? {};
                          if (rapport["match"] != null) {
                            //
                            print("rapport: $type: ${rapport['rapport']}");
                            print(
                                "rapport: $type: ${rapport['rapport'].runtimeType}");
                            //
                            if (type == 1) {
                              Loader.loading();
                              //
                              bool v = await getInfos(match);
                              setMatchCommissaire(rapport['rapport']);
                              //
                              Get.to(CommissaireFormulaire(match, 2));
                            }
                            if (type == 2) {
                              Loader.loading();
                              //
                              bool v = await getInfos(match);
                              setMatchArbitre(rapport['rapport']);
                              //
                              Get.to(HarbitreRapport(match, 2));
                            }
                            if (type == 3) {
                              bool v = await getInfosOf(match);
                              setMatchOfficier(rapport['rapport']);
                              Get.to(OfficierRapport(match, 2));
                            }
                          } else {
                            //
                            Get.snackbar("Désolé",
                                "Aucun rapport n'a été enregistré en local pour ce match.");
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Aperçu du rapport"),
                              Icon(
                                Icons.list_outlined,
                                color: Colors.green.shade900,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //
  setMatchCommissaire(Map match) {
    //match['rapport'] = {

    commissaireController.heure.value = match['heure'];
    commissaireController.date.value = match['date'];
    commissaireController.stade.value = match['stade'];
    commissaireController.equipeA.value = match['equipeA'];
    commissaireController.equipeB.value = match['equipeB'];
    commissaireController.resultatMitemps.value = match['resultatMitemps'];
    commissaireController.resultatFinal.value = match['resultatFinal'];
    commissaireController.arbitreCentral.value = match['arbitreCentral'];
    commissaireController.arbitreAssistant1.value = match['arbitreAssistant1'];
    commissaireController.arbitreAssistant2.value = match['arbitreAssistant2'];
    commissaireController.arbitreProtocolaire.value =
        match['arbitreProtocolaire'];
    //
    commissaireController.scoreMitemps.value = match['scoreMitemps'] ?? {};
    commissaireController.scoreFin.value = match['scoreFin'] ?? {};
    //
    commissaireController.avertissementsJoueursGeneralA.value =
        match['avertissementsJoueursGeneralA'];
    commissaireController.expulssionsJoueursGeneralA.value =
        match['expulssionsJoueursGeneralA'];
    commissaireController.butsJoueursGeneralA.value =
        match['butsJoueursGeneralA'];
    //
    commissaireController.avertissementsJoueursGeneralB.value =
        match['avertissementsJoueursGeneralB'];
    commissaireController.expulssionsJoueursGeneralB.value =
        match['expulssionsJoueursGeneralB'];
    commissaireController.butsJoueursGeneralB.value =
        match['butsJoueursGeneralB'];
    //
    commissaireController.nombreSpectateur.value.text =
        match['nombreSpectateur'];
    commissaireController.attitudeJouerA.value = match['attitudeJouerA'];
    commissaireController.attitudeJouerB.value = match['attitudeJouerB'];
    commissaireController.attitudePublic.value = match['attitudePublic'];
    commissaireController.etatsTerrainListe.value = match['etatsTerrainListe'];
    commissaireController.etatsInstallationListe.value =
        match['etatsInstallationListe'];
    commissaireController.incident.value.text = match['incident'];
    commissaireController.organisationGenerale.value =
        match['organisationGenerale'];
    commissaireController.serviceControle.value = match['serviceControle'];
    commissaireController.servicePolice.value = match['servicePolice'];
    commissaireController.serviceSanitaire.value = match['serviceSanitaire'];
    commissaireController.organisation.value = match['organisation'];
    commissaireController.personnalite.value = match['personnalite'];
    commissaireController.conditionPhysique.value = match['conditionPhysique'];
    commissaireController.capacite.value = match['capacite'];
    commissaireController.execution.value = match['execution'];
    commissaireController.discipline.value = match['discipline'];

    commissaireController.evaluationArbitreAssistant.value =
        match['evaluationArbitreAssistant'];

    commissaireController.evaluationArbitreReserve.value =
        match['evaluationArbitreReserve'];
    commissaireController.commentaire.value.text = match['commentaire'];
    //};
  }

  setMatchArbitre(Map match) {
    //

    arbitreController.heure.value = match['heure'];
    arbitreController.date.value = match['date'];
    arbitreController.stade.value = match['stade'];
    arbitreController.equipeA.value = match['equipeA'];
    arbitreController.equipeB.value = match['equipeB'];
    arbitreController.resultatMitemps.value = match['resultatMitemps'];
    arbitreController.resultatFinal.value = match['resultatFinal'];
    arbitreController.arbitreCentral.value = match['arbitreCentral'];
    arbitreController.arbitreAssistant1.value = match['arbitreAssistant1'];
    arbitreController.arbitreAssistant2.value = match['arbitreAssistant2'];
    arbitreController.arbitreProtocolaire.value = match['arbitreProtocolaire'];
    //__________________________________________
    arbitreController.arbitreProtocolaire.value = match['arbitreProtocolaire'];
    //
    arbitreController.comportementEquipeA.value = match['comportementEquipeA'];
    //
    arbitreController.comportementPubliqueEquipeA.value =
        match['comportementPubliqueEquipeA'];
    //
    arbitreController.comportementPubliqueEquipeB.value =
        match['comportementPubliqueEquipeB'];
    //
    arbitreController.etatInstallation.value = match['etatInstallation'];
    //
    arbitreController.etatsInstallationListe.value =
        match['etatsInstallationListe'];
    //
    arbitreController.etatTerrain.value = match['etatTerrain'];
    //
    arbitreController.etatsTerrainListe.value = match['etatsTerrainListe'];
    //
    //__________________________________________
    arbitreController.joueurEqupeA.value = match['joueurEqupeA'];
    //
    arbitreController.joueurEquipeRemplacantA.value =
        match['joueurEquipeRemplacantA'];
    //
    arbitreController.joueurRemplacantA.value = match['joueurRemplacantA'];
    //
    arbitreController.joueurRemplacantB.value = match['joueurRemplacantB'];
    //
    arbitreController.joueurEqupeB.value = match['joueurEqupeB'];
    //
    arbitreController.joueurEquipeRemplacantB.value =
        match['joueurEquipeRemplacantB'];
    //
    //__________________________________________
    arbitreController.scoreMitemps.value = match['scoreMitemps'];
    arbitreController.scoreFin.value = match['scoreFin'];
    //
    arbitreController.avertissementsJoueursGeneralA.value =
        match['avertissementsJoueursGeneralA'];
    arbitreController.expulssionsJoueursGeneralA.value =
        match['expulssionsJoueursGeneralA'];
    arbitreController.butsJoueursGeneralA.value = match['butsJoueursGeneralA'];
    //
    arbitreController.avertissementsJoueursGeneralB.value =
        match['avertissementsJoueursGeneralB'];
    arbitreController.expulssionsJoueursGeneralB.value =
        match['expulssionsJoueursGeneralB'];
    //
    arbitreController.butsJoueursGeneralB.value = match['butsJoueursGeneralB'];
    //__________________________________________
    //arbitreController.officierEquipeA
    arbitreController.officierEquipeA.value = match['officierEquipeA'];
    //
    arbitreController.officierEquipeB.value = match['officierEquipeB'];
    //___________________________________________
    arbitreController.observationEventuelle.value.text =
        match['observationEventuelle'];
    //
    arbitreController.observation.value.text = match['observation'];
    //
    arbitreController.reserves.value.text = match['reserves'];
    //
    arbitreController.incident.value.text = match['incident'];
    //
    arbitreController.nombreSpectateur.value.text = match['nombreSpectateur'];
    //
    arbitreController.jouea.value.text = match['jouea'];
    //
    arbitreController.nMatch.value.text = match['nMatch'];
  }

  setMatchOfficier(Map match) {
    //

    officierController.heure.value = match['heure'];
    officierController.date.value = match['date'];
    officierController.stade.value = match['stade'];
    officierController.equipeA.value = match['equipeA'];
    officierController.equipeB.value = match['equipeB'];
    officierController.resultatMitemps.value = match['resultatMitemps'];
    officierController.resultatFinal.value = match['resultatFinal'];
    officierController.arbitreCentral.value = match['arbitreCentral'];
    officierController.arbitreAssistant1.value = match['arbitreAssistant1'];
    officierController.arbitreAssistant2.value = match['arbitreAssistant2'];
    officierController.arbitreProtocolaire.value = match['arbitreProtocolaire'];
    //__________________________________________
    officierController.arbitreProtocolaire.value = match['arbitreProtocolaire'];
    //
    //officierController.comportementEquipeA.value = match['comportementEquipeA'];
    //
    officierController.joueurRemplacantA.value = match['joueurRemplacantA'];
    //
    officierController.joueurRemplacantB.value = match['joueurRemplacantB'];
    //__________________________________________
    officierController.avertissementsJoueursGeneralA.value =
        match['avertissementsJoueursGeneralA'];
    //
    officierController.expulssionsJoueursGeneralA.value =
        match['expulssionsJoueursGeneralA'];
    //
    officierController.butsJoueursGeneralA.value = match['butsJoueursGeneralA'];
    //
    officierController.avertissementsJoueursGeneralB.value =
        match['avertissementsJoueursGeneralB'];
    //
    officierController.expulssionsJoueursGeneralB.value =
        match['expulssionsJoueursGeneralB'];
    //
    officierController.butsJoueursGeneralB.value = match['butsJoueursGeneralB'];
    //
    //__________________________________________
    officierController.scoreMitemps.value = match['scoreMitemps'];
    officierController.scoreFin.value = match['scoreFin'];
    //
    officierController.avertissementsJoueursGeneralA.value =
        match['avertissementsJoueursGeneralA'];
    officierController.expulssionsJoueursGeneralA.value =
        match['expulssionsJoueursGeneralA'];
    officierController.butsJoueursGeneralA.value = match['butsJoueursGeneralA'];
    //
    officierController.avertissementsJoueursGeneralB.value =
        match['avertissementsJoueursGeneralB'];
    officierController.expulssionsJoueursGeneralB.value =
        match['expulssionsJoueursGeneralB'];
    //
    officierController.butsJoueursGeneralB.value = match['butsJoueursGeneralB'];
    //__________________________________________
    //arbitreController.officierEquipeA
    officierController.officierEquipeA.value = match['officierEquipeA'];
    //
    officierController.officierEquipeB.value = match['officierEquipeB'];
    //___________________________________________
    //arbitreController.observationEventuelle.value.text =
    //  match['observationEventuelle'];
    //
    officierController.nombreSpectateur.value.text =
        match['nombreSpectateur'] ?? '';
    //
    officierController.jouea.value.text = match['jouea'] ?? '';
    //
    officierController.nMatch.value.text = match['nMatch'] ?? '';
  }

  //
  Future<bool> getInfos(Map match) async {
    //
    commissaireController.commissaire.value =
        await profilController.getOneCommissaire("${match['commissaire']}");
    //
    commissaireController.arbitreCentral.value =
        await profilController.getOneArbitre("${match['arbitreCentrale']}");
    //*
    commissaireController.arbitreAssistant1.value =
        await profilController.getOneArbitre("${match['arbitreAssitant1']}");
    //*
    commissaireController.arbitreAssistant2.value =
        await profilController.getOneArbitre("${match['arbitreAssitant2']}");
    //*
    commissaireController.arbitreProtocolaire.value =
        await profilController.getOneArbitre("${match['arbitreProtocolaire']}");
    //
    //*
    commissaireController.equipeA.value =
        await profilController.getOneEquipe("${match['idEquipeA']}");
    //*
    commissaireController.equipeB.value =
        await profilController.getOneEquipe("${match['idEquipeB']}");
    //
    RapportController.arbitres.value = await profilController.getAllArbitre();
    //
    RapportController.commissaires.value =
        await profilController.getAllCommissaire();
    //
    RapportController.equipes.value = await profilController.getAllEquipes();
    //_________________
    RapportController.joueurEquipeA.value =
        await profilController.getAllJoueurEquipe("${match['idEquipeA']}");
    //*
    RapportController.joueurEquipeB.value =
        await profilController.getAllJoueurEquipe("${match['idEquipeB']}");
    //
    //

    Get.back();
    return true;
  }

  //
  Future<bool> getInfosAr(Map match) async {
    //
    arbitreController.commissaire.value =
        await profilController.getOneCommissaire("${match['commissaire']}");
    //
    arbitreController.arbitreCentral.value =
        await profilController.getOneArbitre("${match['arbitreCentrale']}");
    //*
    arbitreController.arbitreAssistant1.value =
        await profilController.getOneArbitre("${match['arbitreAssitant1']}");
    //*
    arbitreController.arbitreAssistant2.value =
        await profilController.getOneArbitre("${match['arbitreAssitant2']}");
    //*
    arbitreController.arbitreProtocolaire.value =
        await profilController.getOneArbitre("${match['arbitreProtocolaire']}");
    //
    //*
    arbitreController.equipeA.value =
        await profilController.getOneEquipe("${match['idEquipeA']}");
    //*
    arbitreController.equipeB.value =
        await profilController.getOneEquipe("${match['idEquipeB']}");
    //
    RapportController.arbitres.value = await profilController.getAllArbitre();
    //
    RapportController.commissaires.value =
        await profilController.getAllCommissaire();
    //
    RapportController.equipes.value = await profilController.getAllEquipes();
    //_________________
    RapportController.joueurEquipeA.value =
        await profilController.getAllJoueurEquipe("${match['idEquipeA']}");
    //*
    RapportController.joueurEquipeB.value =
        await profilController.getAllJoueurEquipe("${match['idEquipeB']}");
    Get.back();
    return true;
  }

  //
  Future<bool> getInfosOf(Map match) async {
    //
    officierController.commissaire.value =
        await profilController.getOneCommissaire("${match['commissaire']}");
    //
    officierController.arbitreCentral.value =
        await profilController.getOneArbitre("${match['arbitreCentrale']}");
    //*
    officierController.arbitreAssistant1.value =
        await profilController.getOneArbitre("${match['arbitreAssitant1']}");
    //*

    officierController.arbitreAssistant2.value =
        await profilController.getOneArbitre("${match['arbitreAssitant2']}");
    //*
    officierController.arbitreProtocolaire.value =
        await profilController.getOneArbitre("${match['arbitreProtocolaire']}");
    //
    //*
    officierController.equipeA.value =
        await profilController.getOneEquipe("${match['idEquipeA']}");
    //*
    officierController.equipeB.value =
        await profilController.getOneEquipe("${match['idEquipeB']}");
    //
    officierController.arbitres.value = await profilController.getAllArbitre();
    //
    officierController.commissaires.value =
        await profilController.getAllCommissaire();
    //
    RapportController.equipes.value = await profilController.getAllEquipes();
    //_________________
    RapportController.joueurEquipeA.value =
        await profilController.getAllJoueurEquipe("${match['idEquipeA']}");
    //*
    RapportController.joueurEquipeB.value =
        await profilController.getAllJoueurEquipe("${match['idEquipeB']}");
    Get.back();
    return true;
  }
  //
}
