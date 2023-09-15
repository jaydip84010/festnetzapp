import 'package:festnetzapp/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../util/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: <Widget>[
                OnboardingPage(
                  onbrdimg: onbrd1,
                ),
                OnboardingPage(
                  onbrdimg: onbrd2,
                ),
                OnboardingPage(
                  onbrdimg: onbrd3,
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height/50,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 3; i++)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          width: 14.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == i
                                ? Color(0xffff142464)
                                : Colors.grey.withOpacity(0.5),
                          ),
                        ),
                    ],
                  ),SizedBox(height: 60,),
                  if (_currentIndex == 0 || _currentIndex == 1)
                    InkWell(onTap: () {
                      _goToPage(_currentIndex + 1);
                    },
                      child: Image.asset('assets/images/Group 10115.png',height: 65,width: 240,fit: BoxFit.fill,),)
                  else
                    InkWell(onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>HomeScreen() ,));
                    },
                      child: Image.asset('assets/images/Group 10117.png',height: 65,width: 240,fit: BoxFit.fill),)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingPage extends StatelessWidget {
  final String onbrdimg;

  OnboardingPage({
    required this.onbrdimg,
  });

  @override
  Widget build(BuildContext context) {
    final fheight = MediaQuery.of(context).size.height;
    final fwidth = MediaQuery.of(context).size.width;
    return Container(
      height: fheight,
      width: fwidth,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(onbrdimg), fit: BoxFit.fill)),
    );
  }
}
