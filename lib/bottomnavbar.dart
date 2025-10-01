import 'package:flutter/material.dart';
import 'stat_page.dart';
import 'homepage.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  

  @override
  State<Bottomnavbar> createState() => _NavbarState();
}
                   
class _NavbarState extends State<Bottomnavbar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text("Card page", style: TextStyle(fontSize: 24))),
    Center(child: Text(" Scan Page", style: TextStyle(fontSize: 24))),
    StatPage(),
    Center(child: Text(" Profile Page", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color.fromARGB(255, 70, 69, 69),
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Card"),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_rounded),
              label: "Scan",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

 
