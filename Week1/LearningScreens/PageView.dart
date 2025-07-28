import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final PageController _pageViewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page View Widget"),
        actions: [
          IconButton(onPressed: (){
            _pageViewController.previousPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
          }, icon: Icon(Icons.arrow_back_ios)),
          IconButton(onPressed: (){
            _pageViewController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
          }, icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: Stack(
        children : [
          PageView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.blue.shade300,
                child: Center(child: Text("Page ${index+1}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),
              );
            },
            onPageChanged: (value) {
              print(value);
            },
            physics: BouncingScrollPhysics(),
            controller: _pageViewController,

          ),
          Container(
            margin: EdgeInsets.only(top: 650, left: 200, right: 50),
            height: 60,
            color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    _pageViewController.previousPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
                  }, icon: Icon(Icons.arrow_back_ios)),
                  IconButton(onPressed: (){
                    _pageViewController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
                  }, icon: Icon(Icons.arrow_forward_ios)),
                ],
              ),
          ),
        ]
      ),
    );
  }
}
