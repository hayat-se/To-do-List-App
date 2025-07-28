import 'package:flutter/material.dart';

import 'on_boarding_class.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingData> _onboardingList = OnboardingData.onboardingList;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: PageView.builder(
        itemCount: _onboardingList.length,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                child: Image(image: AssetImage(_onboardingList[index].image)),
              ),
              SizedBox(height: 20),
              Text(_onboardingList[index].title, style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              SizedBox(
                height: 100,
                width: 250,
                child: Text(_onboardingList[index].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 15),),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_onboardingList.length, (dotIndex) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == dotIndex ? Colors.black : Colors
                          .grey,
                    ),
                  );
                }),
              ),
            ],
          ),
              Positioned(
                top: 200,
                 left: 40,
                 child: SizedBox(
                   height: 100,
                   width: 100,
                   child: Image(image: AssetImage("assets/images/img4.png")),
                 ),
              ),
              Positioned(
                top: 80,
                left: 220,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image(image: AssetImage("assets/images/img5.png")),
                ),
              ),
              Positioned(
                top: 330,
                left: 250,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image(image: AssetImage("assets/images/img4.png")),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
