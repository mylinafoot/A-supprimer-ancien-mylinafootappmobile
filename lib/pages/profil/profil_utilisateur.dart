import 'package:flutter/material.dart';
import 'package:linafoot/utils/loader.dart';

class ProfilUtilisateur extends StatelessWidget {
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
            },
            leading: const Icon(Icons.person),
            title: const Text("Noms"),
            subtitle: const Text("Mokpongbo Lungu Joel"),
            trailing: const Icon(Icons.edit),
          ),
          ListTile(
            onTap: () {
              //
            },
            leading: const Icon(Icons.person),
            title: const Text("Yéléphone"),
            subtitle: const Text("00243815381693"),
            trailing: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
  //
}
