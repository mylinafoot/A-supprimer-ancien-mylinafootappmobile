import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/utils/loader.dart';
import 'package:svg_flutter/svg_flutter.dart';

import 'affiche/affiche.dart';
import 'nous.dart';
import 'programme/programme_controller.dart';

class Entree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _Entree();
  }
}

class _Entree extends State<Entree> {
  //
  ProgrammeController programmeController = Get.find();
  //
  List pubs = [
    "illicocash png.png",
    "pub_illicocash.jpg",
    "LOGO VERTICAL HD.png",
    "illicocash png.png",
    "LOGO VERTICAL HD.png",
    "LOGO VERTICAL HD.png"
  ];
  //
  @override
  Widget build(BuildContext context) {
    //
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
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
              autoPlayAnimationDuration: const Duration(seconds: 2),
              enlargeCenterPage: true,
            ),
            items: pubs.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    elevation: 1,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      //margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage("assets/$i"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: i == "illicocash png.png"
                          ? const Text(
                              "Achèter votre votre billet et regardez votre match en ligne avec IllicoCash",
                              textAlign: TextAlign.center,
                            )
                          : Container(),
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
        // const Align(
        //   alignment: Alignment.center,
        //   child: Padding(
        //     padding: EdgeInsets.only(left: 30, right: 30, bottom: 5, top: 5),
        //     child: Text(
        //       "Acheter votre billet",
        //       style: TextStyle(
        //         fontWeight: FontWeight.w900,
        //         color: Colors.black,
        //         fontSize: 12,
        //       ),
        //     ),
        //   ),
        // ),
        Expanded(
          flex: 7,
          child: Container(
            //color: Colors.green,
            padding: const EdgeInsets.only(
              top: 5,
              left: 30,
              right: 30,
              bottom: 0,
            ),
            child: FutureBuilder(
              future: programmeController.getCalendrier(),
              builder: (c, t) {
                //
                if (t.hasData) {
                  var id = t.data as int;
                  print("id: $id");
                  return Affiche("$id");
                } else if (t.hasError) {
                  return Container();
                }
                return Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    child: const CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
