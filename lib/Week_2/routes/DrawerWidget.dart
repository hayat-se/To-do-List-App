import 'package:flutter/material.dart';

class DrawerWidgetScreen extends StatefulWidget {
  const DrawerWidgetScreen({super.key});

  @override
  State<DrawerWidgetScreen> createState() => _DrawerWidgetScreenState();
}

class _DrawerWidgetScreenState extends State<DrawerWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Drawer Widget"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            color: Colors.blue.shade400,
            child: ListView(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 35,
                      backgroundImage: AssetImage("assets/images/profile.jpg")
                    ),
                    SizedBox(width: 15,),
                    Text("John Wick", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w400),),
                  ],
                ),
                Divider(color: Colors.white,),
                _listTile(icon: Icons.security, title: "Privacy and Policy" , onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPage()));
                }),
                _listTile(icon: Icons.favorite_outline, title: "Favourite",onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FavouritePage()));
                }),
                _listTile(icon: Icons.notifications_none, title: "Notification" ,onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
                }),
                Divider(color: Colors.white,),
                _listTile(icon: Icons.question_mark_rounded, title: "Help", onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage()));
                }),
                _listTile(icon: Icons.person_outlined, title: "About Us", onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _listTile({required IconData icon, required String title, required VoidCallback onTap}){
    return ListTile(
      iconColor: Colors.white,
      leading: Icon(icon,size: 25,),
      title: Text(title, style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w400),),
      onTap: onTap,
    );
  }
}



class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Privacy Policy Page"),
      ),
    );
  }
}


class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Page"),
      ),
      body: Center(child: Text("Favourite Page"),),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Notification Page"),
      ),
    );
  }
}



class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Help Page"),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("About Page"),
      ),
    );
  }
}

