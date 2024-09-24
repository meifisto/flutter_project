import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/establishments_sectors.dart';
import 'package:flutter_application_1/pages/establishments.dart';
import 'package:flutter_application_1/pages/transactions.dart';
import 'package:flutter_application_1/pages/scan.dart';
import 'package:flutter_application_1/pages/user_profil.dart';
import 'package:flutter_application_1/pages/new_payment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      theme: ThemeData(
      colorSchemeSeed: const Color(0xffefefef),
      scaffoldBackgroundColor: Colors.white),
      home: const MainClass(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/': (context)=> const Home(),
        '/transactions': (context)=> const Transactions(),
        '/establishment_sectors': (context)=> const EstablishmentsSectors(),
        '/establishments': (context)=> const Establishments(),
        '/user_profil': (context)=> const UserProfil(),
        '/scan': (context)=> const Scan(),
      },
    );
  }
}

class MainClass extends StatefulWidget {
  const MainClass({super.key});

  @override
  State<MainClass> createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  int counter = 0;
  List pages = [Home(), NewPayment(), EstablishmentsSectors(), Transactions()];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.menu, color: Colors.white,),
        title: const Center(
        child: const Text("QrPaye", style: TextStyle(color: Colors.white),),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
        ],
        // elevation: 10,
        backgroundColor: const Color(0xff175A97),
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 550,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xff175A97),
                    ),
                    child: Material(
                      color: const Color(0xff175A97),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context); /// Close Navigation drawer before
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfil()),);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNtaWx5JTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 10,),
                                  Text('Sophia',
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.white
                                    ),),
                                  Text('@sophia.com',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white
                                    ),),
                                ],
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text('Home'),
                        onTap: (){
                          /// Close Navigation drawer before
                          Navigator.pop(context);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()),);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.favorite_border),
                        title: const Text('Favourites'),
                        onTap: (){
                          /// Close Navigation drawer before
                          Navigator.pop(context);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen()),);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.workspaces),
                        title: Text('Workflow'),
                        onTap: (){},
                      ),
                      ListTile(
                        leading: Icon(Icons.update),
                        title: Text('Updates'),
                        onTap: (){},
                      ),
                      const Divider(color: Colors.black45,),
                      ListTile(
                        leading: Icon(Icons.account_tree_outlined),
                        title: Text('Plugins'),
                        onTap: (){},
                      ),
                      ListTile(
                        leading: Icon(Icons.notifications_outlined),
                        title: Text('Notifications'),
                        onTap: (){},
                      ),
                    ],
                  )
                ],
                )
            ),
          ],
          
        ),
      ),
        
        
      
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 19, 71, 119),
        currentIndex: pageIndex,
        fixedColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 106, 174, 239),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem( icon: Icon(LineAwesomeIcons.home_solid), label: "Accueil"),
          BottomNavigationBarItem( icon: Icon(LineAwesomeIcons.cash_register_solid), label: "Payement"),
          BottomNavigationBarItem( icon: Icon(LineAwesomeIcons.city_solid), label: "Annuaire"),
          BottomNavigationBarItem( icon: Icon(LineAwesomeIcons.exchange_alt_solid), label: "Transferts"),
        ],
      ),
    );
  }
}