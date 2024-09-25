import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/establishments_sectors.dart';
import 'package:flutter_application_1/pages/establishments.dart';
import 'package:flutter_application_1/pages/transactions.dart';
import 'package:flutter_application_1/pages/scan.dart';
import 'package:flutter_application_1/pages/user_profil.dart';
import 'package:flutter_application_1/pages/new_payment.dart';
import 'colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
        scaffoldBackgroundColor: Colors.white
      ),
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
  int pageIndex = 3;

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
        backgroundColor: AppColors.primaryColor,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            // height: 400, // Définir la hauteur souhaitée pour le Drawer
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: Material(
                    color: AppColors.primaryColor,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context); // Fermer le Drawer avant
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfil()),
                        );
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
                                  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNtaWx5JTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  'Sophia',
                                  style: TextStyle(
                                      fontSize: 28, color: Colors.white),
                                ),
                                Text(
                                  '@sophia.com',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      leading: Icon(LineAwesomeIcons.heart),
                      title: const Text('Favoris'),
                      onTap: () {
                        // Fermer le Drawer avant
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen()),);
                      },
                    ),
                    
                    ListTile(
                      leading: Icon(LineAwesomeIcons.bell_solid),
                      title: Text('Notifications'),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Colors.black45,
                    ),
                    ListTile(
                      leading: Icon(LineAwesomeIcons.redo_alt_solid),
                      title: Text('Mise à jours'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(LineAwesomeIcons.info_circle_solid),
                      title: Text('À propos'),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
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