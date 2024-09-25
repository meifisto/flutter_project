import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionStates();
}

class _TransactionStates extends State<Transactions> {

  List<Map<dynamic, dynamic>> transfertOptions = [
    {
      "label": "Transfert & P2P",
      "icon": LineAwesomeIcons.arrows_alt_h_solid,
      "color": 0xff4bb26b,
      "estimation" : "01h45min de marche environ",
      "distance" : "2.454 km - Cotonou",
    },
    {
      "label": "Solde Mobile Money", 
      "icon": LineAwesomeIcons.dollar_sign_solid,
      "color": 0xffeb8440,
      "estimation" : "03h45min de marche environ",
      "distance" : "1.4564 km - Calavi",
    },
    {
      "label": "Dépôt & Retrait",
      "icon": LineAwesomeIcons.exchange_alt_solid,
      "color": 0xff4077eb,
      "estimation" : "03h45min de marche environ",
      "distance" : "10.4564 km - Cotonou",
    },
    {
      "label": "Forfait Appel",
      "icon": LineAwesomeIcons.phone_alt_solid,
      "color": 0xffe32361,
      "estimation" : "02h45min de marche environ",
      "distance" : "15.4564 km - Calavi",
    },
    {
      "label": "Forfait Internet",
      "icon": LineAwesomeIcons.signal_solid,
      "color": 0xff4bb26b,
      "estimation" : "04h05min de marche environ",
      "distance" : "11.4564 km - Cotonou",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text('Transactions',
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
            ),
          ),

          // Expanded(
          //   child: 
            Container(
              decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 238, 158, 54),
              ),
              height: 450,
              child: 
                ListView.builder(
                  itemCount: transfertOptions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10, left: 3, right: 3),
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Card(
                        elevation: 5,
                        child: 
                          ListTile(
                            leading: Icon(transfertOptions[index]["icon"] as IconData?),
                            title: Text(
                              transfertOptions[index]["label"],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      )
                    );
                  },
                ),
            )
          // )


        ],
      )
    );
  }
}
