import 'dart:ffi';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../http_services/http_service.dart';
import '../colors.dart';

class EstablishmentsSectors extends StatefulWidget {
  const EstablishmentsSectors({super.key});

  @override
  State<EstablishmentsSectors> createState() => _EstablishmentsSectorsState();
}

class _EstablishmentsSectorsState extends State<EstablishmentsSectors> {
  String filterInput = "";
  List<dynamic> _sectors = [];
  List<dynamic> _countries = [];
  bool loadingSector = false;
  
  List<Map<dynamic, dynamic>> sectorsList = [
    {
      "label": "Médical & Hopital & Clinique",
      "icon": LineAwesomeIcons.procedures_solid,
      "color": 0xff4bb26b,
    },
    {
      "label": "Prestation & Services", 
      "icon": LineAwesomeIcons.toolbox_solid,
      "color": 0xffeb8440,
    },
    {
      "label": "Marché des Arts",
      "icon": LineAwesomeIcons.palette_solid,
      "color": 0xff4077eb,
    },
    {
      "label": "Restaurant",
      "icon": LineAwesomeIcons.utensils_solid,
      "color": 0xffe32361,
    },
    {
      "label": "Pharmacie",
      "icon": LineAwesomeIcons.prescription_bottle_alt_solid,
      "color": 0xff4bb26b,
    },
  ];

  @override
  void initState() {
    super.initState();
    // _fetchCountries();
  }

  Future<void> _fetchCountries() async {
    try {
      loadingSector = true;
      final countries = await HttpService.utilsService.getCountries();
        setState(() {
          _countries = countries;
          loadingSector = false;
        });
    } catch (e) {
      // Gérez l'erreur ici
      print(e);
    }
  }

  Future<void> _fetchSectors() async {
    try {
      final sectors = await HttpService.sectorService.getSectors();
      setState(() {
        _sectors = sectors;
      });
    } catch (e) {
      // Gérez l'erreur ici
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    // print("current route name ${ModalRoute.of(context)?.settings.name}" );
    return Scaffold(
      body: Container(
        // color: const Color(0xFFFFE306),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
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
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      
                      children: [
                        ElevatedButton(onPressed: (){}, child: const Text('Liste 2')),
                        ElevatedButton(onPressed: (){}, child: const Text('Liste 3')),
                      ],
                    ),
                  ),
                  
                  // Container(
                  //   margin: EdgeInsets.only(top: 10, bottom: 10),
                  //   child: 
                  //     const Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       children: [
                  //         CircleAvatar(
                  //           radius: 25,
                  //           backgroundImage: AssetImage("assets/images/mtn.jpeg"),
                  //         ),
                  //         CircleAvatar(
                  //           radius: 25,
                  //           backgroundImage: AssetImage("assets/images/moov.png"),
                  //         ),
                  //         CircleAvatar(
                  //           radius: 25,
                  //           backgroundImage: AssetImage("assets/images/dollars.png"),
                  //         ),
                  //       ],
                  //     ),
                  // )
                ],
              ),
            ),
            

            // Text('Liste : 1'),
            // Expanded(child: Container(
            //   child: GridView.count(
            //     crossAxisCount: 4,
            //     // scrollDirection: Axis.horizontal,
            //     children: List.generate(sectorsList.length, (index) {
            //       return Center(
            //         child: Container(
            //           margin: EdgeInsets.all(8.0),
            //           padding: EdgeInsets.all(3.0),
            //           decoration: BoxDecoration(
            //             color: Color(sectorsList[index]["color"]),
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: Center(
            //             child: 
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Icon(sectorsList[index]["icon"] as IconData?, color: Colors.white),
            //                   Text(
            //                     sectorsList[index]["label"],
            //                     style: TextStyle(color: Colors.white),
            //                   ),
            //                 ],
            //               )
            //           ),
            //         ),
            //       );
            //     }),
            //   ),
            // )),

            // Text('Liste : 2'),
            Expanded(child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3, // Adjust this value to control the height of each item
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                ),
                itemCount: sectorsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/establishments');
                    },
                    child: 
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                        decoration: BoxDecoration(
                          color: Color(sectorsList[index]["color"]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Icon(sectorsList[index]["icon"] as IconData?, color: Colors.white),
                          title: Text(sectorsList[index]["label"], 
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            )
                          ),
                        ),
                      ),
                  );
                  
                },
              ),
            )),
            

            // Text('Liste : 3'),
            // Expanded(child: Container(
            //   child: 
            //     ListView.builder(
            //       itemCount: sectorsList.length,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           margin: EdgeInsets.only(top: 10, left: 3, right: 3),
            //           decoration: BoxDecoration(
            //             color: Color(sectorsList[index]["color"]),
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: ListTile(
            //             leading: Icon(sectorsList[index]["icon"] as IconData?, color: Colors.white),
            //             title: Text(sectorsList[index]["label"],style: const TextStyle(color: Colors.white)),
            //             // subtitle: Text (_countries[index]["capital"][0]),
            //           ),
            //         );
            //       },
            //     ),
            // ))
            
            
            // Expanded(
            //   child: Container(
            //     height: 200.0,
            //     child: _countries.isEmpty && loadingSector
            //       ? Center(
            //           child: CircularProgressIndicator(
            //             valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            //             backgroundColor: Colors.white, // Couleur de fond
            //             strokeWidth: 6.0, // Largeur du trait
            //           ),
            //         )
            //       : ListView.builder(
            //           itemCount: _countries.length,
            //           itemBuilder: (context, index) {
            //             return ListTile(
            //               leading: Text (_countries[index]["flag"] ),
            //               title: Text (_countries[index]["name"]["common"]) ,
            //               // subtitle: Text (_countries[index]["capital"][0]),
            //             );
            //           },
            //         ),
            //   )
            // )
            
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
