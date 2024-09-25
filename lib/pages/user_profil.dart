import 'package:flutter/material.dart';
import '../colors.dart';

class UserProfil extends StatefulWidget {
  const UserProfil({super.key});

  @override
  State<UserProfil> createState() => _UserProfilStates();
}

class _UserProfilStates extends State<UserProfil> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.menu, color: Colors.white,),
        title: const Center(
        child: const Text("QrPaye - Profile", style: TextStyle(color: Colors.white),),
        ),
        actions: const [
          
        ],
        // elevation: 10,
        backgroundColor: AppColors.primaryColor,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: const Center(child: Text("profil utilisateur.")),
    );
  }
}
