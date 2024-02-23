import 'dart:async';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class CreerCompte extends StatelessWidget {
  //
  final formKey = GlobalKey<FormState>();
  final telephone = TextEditingController();
  final noms = TextEditingController();
  final mdp = TextEditingController();
  final mdp2 = TextEditingController();
  //
  String codePays = "+243";
  //
  RxBool vue = true.obs;

  LoginController loginController = Get.find();
  //
  RxBool masquer = true.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Nouveau compte",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                            // image: DecorationImage(
                            //   image: ExactAssetImage("assets/logo_MIN SANTE.png"),
                            //   fit: BoxFit.cover,
                            // ),
                            ),
                      ),
                      // Image.asset(
                      //   "assets/logo_MIN SANTE.png",
                      //   width: 300,
                      //   height: 300,
                      // ),
                      // const SizedBox(
                      //   height: 70,
                      // ),
                      // const Align(
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     "Système de surveillance sanitaire des voyageurs entrant, sortant et circulant dans le sol Congolais",
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 70,
                      ),
                      TextFormField(
                        controller: noms,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Veuilliez inserer votre Noms";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: const Icon(Icons.person),
                          hintText: "Nom complet",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: telephone,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Veuilliez inserer votre numéro de téléphone";
                          }
                          if (e.length < 8) {
                            return "Les caratères sont inférieux à 8";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: const Text("Ex: 818140000"),
                          prefixIcon: CountryCodePicker(
                            onChanged: (countryCode) {
                              codePays = countryCode.dialCode!;
                              if (kDebugMode) {
                                print(codePays);
                              }
                            },
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'CD',
                            favorite: const ['+243', 'CD'],
                            // optional. Shows only country name and flag
                            showCountryOnly: true,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                            //showFlag: false,
                          ),
                          hintText: "Téléphone",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: mdp,
                          obscureText: masquer.value,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Veuilliez inserer votre mot de passe";
                            }
                            if (e.length < 8) {
                              return "Les caratères sont inférieux à 8";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Obx(
                              () => IconButton(
                                icon: vue.value
                                    ? const Icon(Icons.lock)
                                    : const Icon(Icons.lock),
                                onPressed: () {
                                  //
                                  masquer.value = !masquer.value;
                                },
                              ),
                            ),
                            hintText: "Mot de passe",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: mdp2,
                          obscureText: masquer.value,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Veuilliez inserer votre mot de passe";
                            }
                            if (mdp2.text != mdp.text) {
                              return "Mot de passe incorrect";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Obx(
                              () => IconButton(
                                icon: vue.value
                                    ? const Icon(Icons.lock)
                                    : const Icon(Icons.lock),
                                onPressed: () {
                                  //
                                  masquer.value = !masquer.value;
                                },
                              ),
                            ),
                            hintText: "Confirmer mot de passe",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            Get.dialog(
                              const Center(
                                child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                            //Get.off(Accueil());
                            // Get.dialog(Container(
                            //   height: 40,
                            //   width: 40,
                            //   alignment: Alignment.center,
                            //   child: const CircularProgressIndicator(),
                            // ));
                            // Timer(Duration(seconds: 3), () {
                            //   Get.back();
                            //   Get.off(Accueil());
                            // });
                            Map e = {
                              "noms": noms.text,
                              "telephone": "$codePays${telephone.text}",
                              "mdp": mdp.text,
                              "role": "1",
                              "superagent": 1,
                            };
                            await loginController.creer(e);
                          }
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            const Size(
                              double.maxFinite,
                              45,
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          child: const Text(
                            "Enregistrer",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  //)
                ),
              ),
            ),
          ),

          // RichText(
          //   textAlign: TextAlign.center,
          //   text: TextSpan(
          //     text: "Power by\n",
          //     style: const TextStyle(
          //       color: Colors.black,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     children: [
          //       TextSpan(
          //         text: "SkyTechnologie",
          //         style: TextStyle(
          //           color: Colors.grey.shade700,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
