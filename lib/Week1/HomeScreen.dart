import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summers_learning_1/Week1/LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _loadUserData() async {
    SharedPreferences db = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue.shade100,
        selectedItemColor: Colors.blue.shade400,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: switchOnTap(),
    );
  }

  Widget switchOnTap() {
    switch (_currentIndex) {
      case 0:
        return Center(
          child: Text(
            "Home Screen",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      case 1:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Settings Screen", style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: logout,
                child: Text("Logout Account"),
              ),
              ElevatedButton(
                onPressed: removeAccount,
                child: Text("Delete Account"),
              ),
            ],
          ),
        );
      case 2:
        return Center(
          child: Text(
            "Profile Screen",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      default:
        return Center(
          child: Text(
            "Unknown Screen",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
    }
  }

  void logout() async {
    SharedPreferences db = await SharedPreferences.getInstance();
    db.setBool("isLoggedIn", false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  void removeAccount() async {
    SharedPreferences db = await SharedPreferences.getInstance();
    await db.remove("name");
    await db.remove("email");
    await db.remove("password");
    await db.setBool("isLoggedIn", false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
