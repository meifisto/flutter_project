import 'package:flutter/material.dart';
import '../colors.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanStates();
}

class _ScanStates extends State<Scan> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.menu, color: Colors.white,),
        title: const Center(
        child: const Text("QrPaye - Scan", style: TextStyle(color: Colors.white),),
        ),
        actions: const [
          
        ],
        // elevation: 10,
        backgroundColor: AppColors.primaryColor,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: const Center(child: Text("Scan du code qr.")),
    );
  }
}
