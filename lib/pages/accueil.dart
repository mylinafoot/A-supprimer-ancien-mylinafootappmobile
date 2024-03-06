import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/choix.dart';
import 'package:linafoot/pages/login/login.dart';
import 'package:linafoot/pages/nous.dart';
import 'package:linafoot/pages/programme/programme.dart';
import 'package:linafoot/pages/statistique/statistique.dart';
import 'package:linafoot/utils/loader.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:svg_flutter/svg.dart';

import 'actus/actus.dart';
import 'billets/billets.dart';
import 'historique/historique.dart';
import 'live/direct3.dart';
import 'live/live.dart';
import 'rapports/commissaire/commissaire.dart';
import 'rapports/rapports.dart';

class Accueil extends StatelessWidget {
  //Choix//Historique//Programme//Live//Statistique//
  Rx vue = Rx(Statistique());
  //
  Accueil({super.key}) {
    //
    _controller = PersistentTabController(initialIndex: 0);
  }
  //
  late PersistentTabController _controller;

  //
  RxInt currentIndex = 0.obs;
  //
  List rencontres = [
    ["AS DAUPHIN NOIR.png", "AS MANIEMA UNION.png"],
  ];
  //
  List vues = [
    {"titre": "Accueil", "icon": "IcBaselineSportsSoccer.svg"},
    {"titre": "Match en direct", "icon": "IonSocialYoutubeOutline.svg"},
    {"titre": "Calendrier", "icon": "GalaEditor.svg"},
    {"titre": "Achat billet", "icon": "MakiSoccer11.svg"},
    {"titre": "Admin", "icon": "GalaPortrait1.svg"},
    //{"titre": "A propos", "icon": "IonHelpOutline.svg"},
  ];
  //
  List pubs = [
    "LOGO LINAFOOT RDC.png",
    "LOGO VERTICAL HD.png",
    "LOGO LINAFOOT RDC.png",
    "LOGO VERTICAL HD.png",
    "LOGO VERTICAL HD.png"
  ];
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      backgroundColor: Loader.backgroundColor,
      body: PersistentTabView(
        context,
        controller: _controller,

        screens: [
          Scaffold(
            backgroundColor: Loader.backgroundColor,
            appBar: AppBar(
              title: const Text("Linafoot"),
              centerTitle: true,
              backgroundColor: Loader.backgroundColor,
              actions: [
                IconButton(
                  onPressed: () {
                    //BxsHelpCircle
                    Get.to(Nous());
                    //
                  },
                  icon: SvgPicture.asset(
                    'assets/BxsHelpCircle.svg',
                    width: 30,
                    height: 30,
                    semanticsLabel: 'BxsHelpCircle.svg',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: Get.size.height / 2.2,
                  //color: Colors.red,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 350,
                      autoPlay: true,
                      viewportFraction: 0.9,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      enlargeCenterPage: true,
                    ),
                    items: pubs.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Card(
                            elevation: 1,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              //margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage("assets/$i"),
                                ),
                              ),
                            ),
                            // child: Text(
                            //   'text $i',
                            //   style: TextStyle(fontSize: 16.0),
                            // ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: ListView(
                    padding: const EdgeInsets.only(
                      top: 50,
                      left: 30,
                      right: 30,
                      bottom: 0,
                    ),
                    children: List.generate(
                      rencontres.length,
                      (index) {
                        //
                        List r = rencontres[index];
                        //
                        return Card(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              //
                              Get.dialog(
                                Center(
                                  child: Card(
                                    elevation: 1,
                                    child: Container(
                                      height: 150,
                                      width: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset(
                                            'assets/LOGO LINAFOOT RDC.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                          const Text(
                                            "Acheter le billé de ce match",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              //
                                              DateTime dateTime =
                                                  DateTime.now();
                                              print(dateTime);
                                              if (dateTime.day == 3 &&
                                                  dateTime.month == 3 &&
                                                  dateTime.year == 2024) {
                                                //
                                                Get.to(const Direct3());
                                              }
                                            },
                                            child: const Text("Suivre"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 150,
                              width: double.maxFinite,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    height: 25,
                                    width: double.maxFinite,
                                    //color: Colors.black,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.yellow,
                                          Colors.blue.shade700,
                                          Colors.blue.shade700,
                                          Colors.red,
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "03/03/2024",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "15:30",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Image.asset(
                                                "assets/AS_Vita_Club_(logo).png"),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 50,
                                          child: Text(
                                            "0 - 0",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Image.asset(
                                                "assets/LES AIGLES DU CONGO.png"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          Programme(),
          Statistique(),
          Live(),
          Actualites(),
          Container(
            color: Loader.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  onTap: () {
                    //

                    Get.to(Nous());
                  },
                  leading: Icon(Icons.person),
                  title: Text("Profil"),
                  subtitle: Text(
                    "Compte",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    //
                    Get.to(Billet());
                  },
                  leading: Icon(CupertinoIcons.ticket),
                  title: Text("Billets"),
                  subtitle: Text(
                    "vos billets electronique",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    //
                    Get.to(Nous());
                  },
                  leading: Icon(Icons.history),
                  title: Text("Abonnement"),
                  subtitle: Text(
                    "Direct et billets",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    //
                    Get.to(Nous());
                  },
                  leading: Icon(Icons.info_outline_rounded),
                  title: Text("Qui sommes nous"),
                  subtitle: Text(
                    "Missions & objectifs",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    //
                    //Get.to(Login());
                  },
                  leading: Icon(Icons.verified_user_outlined),
                  title: Text("Mention légale"),
                  subtitle: Text(
                    "condition d'utilisation",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    //
                    Get.to(Rapport());
                  },
                  leading: Icon(Icons.admin_panel_settings),
                  title: Text("Administration"),
                  subtitle: Text(
                    "Rapports",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home_rounded),
            title: ("Accueil"),
            activeColorPrimary: CupertinoColors.activeBlue,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.history),
            title: ("Calendrier"),
            activeColorPrimary: CupertinoColors.activeBlue,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.chart_pie),
            title: ("Classements"),
            activeColorPrimary: CupertinoColors.activeBlue,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.play_circle),
            title: ("Direct"),
            activeColorPrimary: CupertinoColors.activeBlue,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.language),
            title: ("Actualité"),
            activeColorPrimary: CupertinoColors.activeBlue,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            title: ("Plus"),
            activeColorPrimary: CupertinoColors.activeBlue,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
        ],
        confineInSafeArea: true,
        backgroundColor: Colors.grey.shade900, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: false,
        popAllScreensOnTapAnyTabs: true,
        popActionScreens: PopActionScreensType.once,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 100),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
    // return Scaffold(
    //   //body: Obx(() => vue.value),
    //   body: Obx(
    //     () => currentIndex.value == 0
    //         ? Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               const SizedBox(
    //                 height: 25,
    //               ),
    //               Container(
    //                 height: 230,
    //                 //color: Colors.red,
    //                 child: CarouselSlider(
    //                   options: CarouselOptions(
    //                     height: 350,
    //                     autoPlay: true,
    //                     autoPlayAnimationDuration: const Duration(seconds: 1),
    //                   ),
    //                   items: pubs.map((i) {
    //                     return Builder(
    //                       builder: (BuildContext context) {
    //                         return Card(
    //                           child: Container(
    //                             width: MediaQuery.of(context).size.width,
    //                             //margin: EdgeInsets.symmetric(horizontal: 5.0),

    //                             decoration: BoxDecoration(
    //                               image: DecorationImage(
    //                                 image: ExactAssetImage("assets/$i"),
    //                               ),
    //                             ),
    //                           ),
    //                           // child: Text(
    //                           //   'text $i',
    //                           //   style: TextStyle(fontSize: 16.0),
    //                           // ),
    //                         );
    //                       },
    //                     );
    //                   }).toList(),
    //                 ),
    //               ),

    //               // Expanded(
    //               //   flex: 1,
    //               //   child: GridView.count(
    //               //     padding: const EdgeInsets.all(20),
    //               //     crossAxisCount: 2,
    //               //     crossAxisSpacing: 7,
    //               //     mainAxisSpacing: 7,
    //               //     children: List.generate(
    //               //       vues.length,
    //               //       (index) {
    //               //         return Card(
    //               //           elevation: 1,
    //               //           child: Column(
    //               //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               //             children: [
    //               //               SvgPicture.asset(
    //               //                 'assets/${vues[index]['icon']}',
    //               //                 width: 80,
    //               //                 height: 80,
    //               //                 semanticsLabel: '${vues[index]['icon']}',
    //               //                 color: Colors.blue,
    //               //               ),
    //               //               Align(
    //               //                 alignment: Alignment.center,
    //               //                 child: Text(
    //               //                   "${vues[index]['titre']}",
    //               //                   style: TextStyle(
    //               //                     fontSize: 15,
    //               //                   ),
    //               //                 ),
    //               //               )
    //               //             ],
    //               //           ),
    //               //         );
    //               //       },
    //               //     ),
    //               //   ),
    //               // )
    //             ],
    //           )
    //         : currentIndex.value == 1
    //             ? Statistique()
    //             : currentIndex.value == 2
    //                 ? Statistique()
    //                 : currentIndex.value == 3
    //                     ? Live()
    //                     : currentIndex.value == 4
    //                         ? Programme()
    //                         : currentIndex.value == 5
    //                             ? Historique()
    //                             : Login(),
    //   ),
    //   bottomNavigationBar: Obx(
    //     () => BottomNavigationBar(
    //       onTap: (e) {
    //         //
    //         currentIndex.value = e;
    //         //
    //         // if (e == 0) {
    //         //   vue.value = Statistique();
    //         // }
    //         // //
    //         // if (e == 1) {
    //         //   vue.value = Live();
    //         // }
    //         // //
    //         // if (e == 2) {
    //         //   vue.value = Programme();
    //         // }
    //         // //
    //         // if (e == 3) {
    //         //   vue.value = Historique();
    //         // }
    //         // //
    //         // if (e == 4) {
    //         //   vue.value = Login();
    //         // }
    //         //
    //       },
    //       selectedItemColor: Colors.blue,
    //       currentIndex: currentIndex.value,
    //       items: List.generate(
    //         vues.length,
    //         (index) {
    //           if (index == 2) {
    //             //IMG-20240116-WA0003.jpg
    //             return BottomNavigationBarItem(
    //               label: vues[index]['titre'],
    //               icon: Image.asset(
    //                 'assets/LOGO LINAFOOT RDC.png',
    //                 width: 30,
    //                 height: 30,
    //               ),
    //               activeIcon: Image.asset(
    //                 'assets/LOGO LINAFOOT RDC.png',
    //                 width: 35,
    //                 height: 35,
    //               ),
    //             );
    //           } else {
    //             return BottomNavigationBarItem(
    //               label: vues[index]['titre'],
    //               icon: SvgPicture.asset(
    //                 'assets/${vues[index]['icon']}',
    //                 width: 25,
    //                 height: 25,
    //                 semanticsLabel: '${vues[index]['icon']}',
    //               ),
    //               activeIcon: SvgPicture.asset(
    //                 'assets/${vues[index]['icon']}',
    //                 width: 30,
    //                 height: 30,
    //                 semanticsLabel: '${vues[index]['icon']}',
    //                 color: Colors.blue,
    //               ),
    //             );
    //           }
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
