import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeStates();
}

class _HomeStates extends State<Home> {
  List imagesSrc = [
    'assets/images/img_1.jpg',
    'assets/images/img_2.jpg',
    'assets/images/img_3.jpg'
  ];
  var appBar = AppBar();

  List<Map<Object, dynamic>> filterOptions = [
    {
      "label": "Visite",
      "icon": LineAwesomeIcons.handshake,
    },
    {
      "label": "RDV", 
      "icon": LineAwesomeIcons.calendar,
    },
    {
      "label": "Réunions",
      "icon": LineAwesomeIcons.microphone_solid,
    },
    {
      "label": "Carte Fidélité & Membres",
      "icon": LineAwesomeIcons.heart,
    },
  ];

  
  @override
  Widget build(BuildContext context) {

    // print("current route name ${ModalRoute.of(context)?.settings.name}" );

    return Container(
      decoration: const BoxDecoration(
        // Image set to background of the body
        image: DecorationImage(
          image: AssetImage("assets/images/12316.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        children: [
          // ======================================= section 1
          Container(
            padding: EdgeInsets.symmetric(vertical: 120),
            decoration: BoxDecoration(
              // color: const Color.fromARGB(255, 241, 171, 171).withOpacity(0.5),
            ),
            // height: (MediaQuery.of(context).size.height - appBar.preferredSize.height) / 4,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // e-factures 
                  ElevatedButton(
                    onPressed: (){},
                    child: Column(
                      children: [
                        Icon(
                          LineAwesomeIcons.file_invoice_dollar_solid
                        ),
                        Text('eFactures'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(5),
                      elevation: 7,
                    )
                  ),
                  // scan
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/scan');
                    },
                    child: Column(
                      children: [
                        Icon(
                          LineAwesomeIcons.qrcode_solid
                        ),
                        Text('Scan'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(5),
                      elevation: 7,
                    )
                  ),
                ],
              ),
            ),
          ),
          // ======================================= section 2
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
              ),
              width: double.infinity,
              // height: 290,
              padding: const EdgeInsets.all(5),
              child: 
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rechercher - Bien et services", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            Icon(Icons.search),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: double.infinity,
                          child:
                            Flexible(
                              child: 
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: filterOptions.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 10, left: 3, right: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      leading: Icon(filterOptions[index]["icon"] as IconData?),
                                      title: Text (" ${filterOptions[index]["label"]}" ),
                                      // subtitle: Text (_countries[index]["capital"][0]),
                                    ),
                                  );   
                                },
                              )
                            )
                        ),
                      ),    
                    ],
                  ),
                ),
            ),
          
          ),
          
        ],
      ),
    );
  }

}
