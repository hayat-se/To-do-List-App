import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    setState(() {
      _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar lesson"),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.chat_bubble), text: "Chats"),
              Tab(
                icon: Icon(Icons.circle_notifications_sharp),
                text: "Updates",
              ),
              Tab(icon: Icon(Icons.call), text: "Calls"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                trailing: Text(TimeOfDay.now().format(context)),
                title: Text("John Wick"),
                subtitle: Text("See you next Time"),
              ),
            ),

            Center(child: Text("Status Screen")),
            Center(child: Text("CAll Histore here, ")),
          ],
        ),
      );
  }
}
