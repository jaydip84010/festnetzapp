import 'package:festnetzapp/home_screen/home_screen.dart';
import 'package:festnetzapp/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final fheight = MediaQuery.of(context).size.height;
    final fwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Container(
            height: fheight,
            width: fwidth,

            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 95,
                    width: fwidth ,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                  ),
                ),
                Positioned(
                    left: fwidth / 3,
                    top: fheight/27,
                    child: Image.asset(
                      "assets/images/Favoritenlogo.png",
                      height: 55,
                      width: 180,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                    top: fheight / 8,
                    child: Column(
                      children: [
                        Image.asset("assets/images/Group 10536.png",
                            height: fheight / 3, width: fwidth)
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: fheight/8,width: fwidth*1.05,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/nav_bar.png',
                              ),
                              fit: BoxFit.fill)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
                              },
                              child: Image.asset(
                                'assets/images/F.png',
                                height: 45,
                                width: 45,
                                  color:Colors.grey.withOpacity(0.7)
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FavouriteScreen(),));
                              },
                              child: Image.asset(
                                'assets/images/51a3dbe0e593ba390ac13cba118295e4.png',
                                height: 40,
                                width: 40,
                                color:Color(0xffff142464),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SettingScreen(),));
                              },
                              child: Image.asset(
                                'assets/images/Icon ionic-ios-settings.png',
                                height: 40,
                                width: 40,color:Colors.grey.withOpacity(0.7)
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
