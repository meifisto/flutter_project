import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionStates();
}

class _TransactionStates extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color(0xFFFFE306),
      child: const Center(child: Text("Transactions financières.")),
    );
  }
}
