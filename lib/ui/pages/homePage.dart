import 'package:flutter/material.dart';

import 'package:sgsp_app/ui/widgets/sgsp_AppBar.dart';

import 'mainPages/denuncia_Page.dart';
import 'mainPages/ampliacion_Page.dart';
import 'mainPages/consultas_Page.dart';
import 'mainPages/profile_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> listPages = [
    const ConsultasPage(),
    const DenunciaPage(),
    const AmpliacionPage(),
    const ProfileUser()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: myDrawer(_selectedIndex, context),
      appBar: SgspAppBar(_selectedIndex, context),
      body: listPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Consultas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Denuncia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.move_down_rounded),
            label: 'Ampliación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
