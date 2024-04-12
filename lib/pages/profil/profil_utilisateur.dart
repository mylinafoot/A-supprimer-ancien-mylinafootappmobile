import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/login/login_controller.dart';
import 'package:linafoot/utils/loader.dart';

class ProfilUtilisateur extends StatelessWidget {
  //
  Map utilisateur;
  //
  LoginController loginController = Get.find();
  //
  TextEditingController nomUtilisateur = TextEditingController();
  //
  ProfilUtilisateur(this.utilisateur);
  //

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Loader.backgroundColor,
      ),
      backgroundColor: Loader.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ListTile(
            onTap: () {
              //

              Get.dialog(
                Material(
                  color: Colors.transparent,
                  child: Center(
                    child: Card(
                      elevation: 1,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 300,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Votre noms complet",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: nomUtilisateur,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(Icons.numbers),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        const Size(
                                          double.maxFinite,
                                          45,
                                        ),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Color.fromARGB(255, 0, 90, 23),
                                      ),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.maxFinite,
                                      child: const Text(
                                        "Valider",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //
                                      Get.back();
                                    },
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        const Size(
                                          double.maxFinite,
                                          45,
                                        ),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Loader.backgroundColor),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.maxFinite,
                                      child: const Text(
                                        "Annuler",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            leading: const Icon(Icons.person),
            title: const Text("Noms"),
            subtitle: Text("${utilisateur['nomUtilisateur']}"),
            trailing: const Icon(Icons.edit),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Téléphone"),
            subtitle: Text("${utilisateur['telephone']}"),
            //trailing: const Icon(Icons.edit),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: const Text("Pays"),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: CountryCodePicker(
                    onChanged: print,
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'CD',
                    //favorite: ['+39', 'FR'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(
          //       color: Colors.grey,
          //     ),
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 4,
          //         child: Container(
          //           padding: const EdgeInsets.only(left: 15),
          //           alignment: Alignment.centerLeft,
          //           child: const Text("Ville"),
          //         ),
          //       ),
          //       Expanded(
          //         flex: 7,
          //         child: Container(
          //           height: 47,
          //           child: DropdownButton(
          //             onChanged: (c) {},
          //             items: [],
          //           ),
          //           padding: EdgeInsets.only(right: 15),
          //           alignment: Alignment.centerRight,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () async {
              utilisateur['nomUtilisateur'] = nomUtilisateur.text;
              loginController.modifierUtilisateur(utilisateur);
              //modifierUtilisateur
            },
            child: Text(
              "Modifier",
            ),
          )
        ],
      ),
    );
  }
  //
}
