import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class NewPayment extends StatefulWidget {
  const NewPayment({super.key});

  @override
  State<NewPayment> createState() => _NewPaymentState();
}

class _NewPaymentState extends State<NewPayment> {
  String filterInput = "";
  List<dynamic> _sectors = [];
  List<dynamic> _countries = [];
  bool loadingSector = false;
  
  List<Map<dynamic, dynamic>> servicesList = [
    {
      "label": "Pharmacie Iita",
      "icon": LineAwesomeIcons.procedures_solid,
      "color": 0xff4bb26b,
      "estimation" : "01h45min de marche environ",
      "distance" : "2.454 km - Cotonou",
    },
    {
      "label": "Orca Déco", 
      "icon": LineAwesomeIcons.toolbox_solid,
      "color": 0xffeb8440,
      "estimation" : "03h45min de marche environ",
      "distance" : "1.4564 km - Calavi",
    },
    {
      "label": "Marché des Arts de Gbégamey",
      "icon": LineAwesomeIcons.palette_solid,
      "color": 0xff4077eb,
      "estimation" : "03h45min de marche environ",
      "distance" : "10.4564 km - Cotonou",
    },
    {
      "label": "Karim 24",
      "icon": LineAwesomeIcons.utensils_solid,
      "color": 0xffe32361,
      "estimation" : "02h45min de marche environ",
      "distance" : "15.4564 km - Calavi",
    },
    {
      "label": "Mafita Helpers",
      "icon": LineAwesomeIcons.prescription_bottle_alt_solid,
      "color": 0xff4bb26b,
      "estimation" : "04h05min de marche environ",
      "distance" : "11.4564 km - Cotonou",
    },
  ];

  @override
  void initState() {
    super.initState();
    // _fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: const  Color(0xff175A97),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10), 
                  bottomRight: Radius.circular(10)
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Rechercher un service / établissement",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        
                      ),
                      onChanged: (value){
                        setState(() {
                          filterInput = value;
                        });
                      },
                    ),
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: 
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/images/mtn.jpeg"),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/images/moov.png"),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/images/dollars.png"),
                          ),
                        ],
                      ),
                  )
                ],
              ),
            ),

            Expanded(child: Container(
              child: 
                ListView.builder(
                  itemCount: servicesList.length,
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
                            leading: Icon(servicesList[index]["icon"] as IconData?),
                            title: Text(
                              servicesList[index]["label"],
                              style: const TextStyle(
                                // fontSize: 12.0
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text (servicesList[index]["estimation"]),
                                Text (servicesList[index]["distance"]),
                              ],
                            ),
                          ),
                      )
                    );
                  },
                ),
            ))
            
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   elevation: 5,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(50),
      //   ),
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/scan');
      //     // setState(() {
      //     //   pageIndex = 3;
      //     // });
      //   },
      //   label: const Text('Scan'),
      //   icon: const Icon(
      //     LineAwesomeIcons.qrcode_solid,
      //   ),
      // ),
    );
  }
}
