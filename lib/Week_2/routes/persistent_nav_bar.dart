import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class PersistentNavBarScreen extends StatefulWidget {
  const PersistentNavBarScreen({super.key});

  @override
  State<PersistentNavBarScreen> createState() => _PersistentNavBarScreenState();
}

class _PersistentNavBarScreenState extends State<PersistentNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: PersistentTabView(
          context,
          screens: [
            HomeScreen(),
            SettingScreen(),
            ProfileScreen(),
          ],
          items: [
            PersistentBottomNavBarItem(
              icon: Icon(Icons.home),
              title: "Home",
                activeColorSecondary: Colors.black,
                inactiveColorPrimary: Colors.grey.shade500
            ),
            PersistentBottomNavBarItem(
              icon: Icon(Icons.settings),
              title: "Settings",
                activeColorSecondary: Colors.black,
                inactiveColorPrimary: Colors.grey.shade500
            ),
            PersistentBottomNavBarItem(
              icon: Icon(Icons.person),
              title: "Profile",
                activeColorSecondary: Colors.black,
                inactiveColorPrimary: Colors.grey.shade500
            ),
          ],
          backgroundColor: Colors.blue.shade50,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            colorBehindNavBar: Colors.white
          ),
          navBarStyle: NavBarStyle.style10,
          animationSettings: NavBarAnimationSettings(
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              animateTabTransition: true,
              curve: Curves.easeOut ,
              duration: Duration(milliseconds: 400),
            )
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"), centerTitle: true),
      body: Center(child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueAccent.shade400,
        child: Center(child: Text("Home Page")),
      ),),
    );
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting Page"), centerTitle: true),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page"), centerTitle: true),
    );
  }
}
