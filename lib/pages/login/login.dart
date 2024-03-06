import 'dart:async';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/accueil.dart';
import 'package:linafoot/pages/choix.dart';
import 'package:linafoot/utils/loader.dart';

import 'creer_compte.dart';
import 'login_controller.dart';
import 'mdp_oublie.dart';

class Login extends StatelessWidget {
  //
  int i;
  Login(this.i);
  //
  final formKey = GlobalKey<FormState>();
  // final telephone = TextEditingController();
  // final mdp = TextEditingController();
  final mdpMatch = TextEditingController();
  //
  DateTime dateTime = DateTime.now();
  //
  RxBool vue = true.obs;
  String codePays = "+243";
  LoginController loginController = Get.find();
  RxBool masquer = true.obs;
  RxBool masquer2 = true.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          //backgroundColor: Colors.transparent,
          //resizeToAvoidBottomPadding: true,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
            //backgroundColor: Colors.transparent,
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
                          image: DecorationImage(
                            image:
                                ExactAssetImage("assets/LOGO LINAFOOT RDC.png"),
                            fit: BoxFit.contain,
                          ),
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
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Vous etes commissaire de match ou arbitre central voulant faire votre rapport, veuillez vous connecter avec vos identifiants pour commencer.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 70,
                      // ),
                      // TextFormField(
                      //   controller: telephone,
                      //   keyboardType: TextInputType.number,
                      //   //autofocus: true,
                      //   //focusNode: FocusNode(skipTraversal: true),
                      //   validator: (e) {
                      //     if (e!.isEmpty) {
                      //       return "Veuilliez inserer votre numéro de téléphone";
                      //     }
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     contentPadding:
                      //         const EdgeInsets.symmetric(vertical: 5),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //     ),
                      //     prefixIcon: Icon(Icons.phone_android),
                      //     // prefixIcon: CountryCodePicker(
                      //     //   onChanged: (countryCode) {
                      //     //     codePays = countryCode.dialCode!;
                      //     //     if (kDebugMode) {
                      //     //       print(codePays);
                      //     //     }
                      //     //   },
                      //     //   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      //     //   initialSelection: 'CD',
                      //     //   favorite: ['+243', 'CD'],
                      //     //   // optional. Shows only country name and flag
                      //     //   showCountryOnly: true,
                      //     //   // optional. Shows only country name and flag when popup is closed.
                      //     //   showOnlyCountryWhenClosed: false,
                      //     //   // optional. aligns the flag and the Text left
                      //     //   alignLeft: false,
                      //     //   //showFlag: false,
                      //     // ),
                      //     hintText: "Téléphone",
                      //     hintStyle: TextStyle(
                      //       fontSize: 12,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Obx(
                      //   () => TextFormField(
                      //     controller: mdp,
                      //     //autofocus: true,
                      //     //focusNode: FocusNode(skipTraversal: true),
                      //     obscureText: masquer.value,
                      //     validator: (e) {
                      //       if (e!.isEmpty) {
                      //         return "Veuilliez inserer votre mot de passe";
                      //       }
                      //       return null;
                      //     },
                      //     decoration: InputDecoration(
                      //       contentPadding:
                      //           const EdgeInsets.symmetric(vertical: 5),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //       suffixIcon: Obx(
                      //         () => IconButton(
                      //           icon: vue.value
                      //               ? const Icon(Icons.remove_red_eye)
                      //               : const Icon(Icons.remove_red_eye),
                      //           onPressed: () {
                      //             //
                      //             masquer.value = !masquer.value;
                      //           },
                      //         ),
                      //       ),
                      //       prefixIcon: Icon(
                      //         Icons.lock,
                      //       ),
                      //       hintText: "Mot de passe",
                      //       hintStyle: TextStyle(
                      //         fontSize: 12,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      const SizedBox(
                        height: 20,
                      ),

                      Obx(
                        () => TextFormField(
                          controller: mdpMatch,
                          //autofocus: true,
                          //focusNode: FocusNode(skipTraversal: true),
                          obscureText: masquer2.value,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Veuilliez inserer votre mot de passe";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixIcon: Obx(
                              () => IconButton(
                                icon: vue.value
                                    ? const Icon(Icons.remove_red_eye)
                                    : const Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  //
                                  masquer2.value = !masquer2.value;
                                },
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.sports,
                            ),
                            hintText: "Code du match",
                            hintStyle: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          //
                          if (formKey.currentState!.validate()) {
                            //Get.off(Accueil());
                            // Get.dialog(
                            //   Container(
                            //     height: 40,
                            //     width: 40,
                            //     alignment: Alignment.center,
                            //     child: const CircularProgressIndicator(),
                            //   ),
                            // );
                            //
                            // Timer(Duration(seconds: 3), () {
                            //   Get.back();
                            //   Get.off(Accueil());
                            // });
                            // Map e = {
                            //   "telephone": "$codePays${telephone.text}",
                            //   "mdp": mdp.text,
                            // };
                            //
                            //Get.offAll(Accueil());
                            //appController.login(e);
                            //loginController.login(e);
//
                            //
                            Loader.loading();
                            //
                            Map e = {};
                            //
                            if (i == 1) {
                              e = {
                                "mdpMatch": mdpMatch.text,
                                "date":
                                    "${dateTime.day}-${dateTime.month}-${dateTime.year}",
                              };
                              //
                              loginController.login(e, i);
                            } else if (i == 2) {
                              e = {
                                "mdpMatch": mdpMatch.text,
                                "date":
                                    "${dateTime.day}-${dateTime.month}-${dateTime.year}",
                              };
                              //
                              loginController.login(e, i);
                            } else {
                              e = {
                                "mdpMatch": mdpMatch.text, // mdpMatch.text,
                                "date":
                                    "${dateTime.day}-${dateTime.month}-${dateTime.year}",
                              };

                              //
                              loginController.login(e, i);
                            }
                            //dateTime
                          }
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
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          child: const Text(
                            "S'authentifier",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          //
                          //Get.to(MdpOublie());
                          //
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
                          //backgroundColor:
                          //  MaterialStateProperty.all(Colors.red.shade900),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          child: const Text(
                            "Mot de passe oublié",
                            style: TextStyle(
                              //color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     //
                      //     Get.to(CreerCompte());
                      //     //
                      //   },
                      //   style: ButtonStyle(
                      //     fixedSize: MaterialStateProperty.all(
                      //       const Size(
                      //         double.maxFinite,
                      //         45,
                      //       ),
                      //     ),
                      //     shape:
                      //         MaterialStateProperty.all(RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //     )),
                      //     backgroundColor:
                      //         MaterialStateProperty.all(Colors.red),
                      //   ),
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     width: double.maxFinite,
                      //     child: const Text(
                      //       "Créer un nouveau compte",
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
