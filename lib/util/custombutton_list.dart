import 'package:flutter/material.dart';

class CustomButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: "Freunde einladen",
              icon: "assets/images/Path 58.png",
              endIcon: "assets/images/Path 59.png",
            ),
            SizedBox(height: 10),
            CustomButton(
              text: "Feedback",
              icon: "assets/images/Path 57.png",
              endIcon: "assets/images/Path 9.png",
            ),
            SizedBox(height: 10),
            CustomButton(
              text: "@festnetzapp",
              icon: "assets/images/Icon awesome-instagram.png",
              endIcon: "assets/images/Path 9.png",
            ),
            SizedBox(height: 10),
            CustomButton(
              text: "@festnetzapp",
              icon: "assets/images/Icon simple-tiktok.png",
              endIcon: "assets/images/Path 9.png",
            ),
            SizedBox(height: 10),
            CustomButton(
              text: "www.festnetzapp.de",
              icon: "assets/images/Path 51.png",
              endIcon: "assets/images/Path 54.png",
            ),
            SizedBox(height: 10),
            CustomButton(
              text: "Kontakt",
              icon: "assets/images/Group 10534.png",
              endIcon: "assets/images/Icon material-email.png",
            ),
            SizedBox(height: 20),
            Text(
              "Rechtliches",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 1,
              width: 320,
              color: Colors.black,
            ),
            SizedBox(height: 16),
            CustomButton(
              text: "AGB",
              icon: "assets/images/37.png",
              endIcon: "assets/images/Path 54.png",
            ),
            SizedBox(height: 10),
            CustomButton(
              text: "Datenschutz",
              icon: "assets/images/Path 47.png",
              endIcon: "assets/images/Path 54.png",
            ),
            SizedBox(height: 10),
            CustomButton(
              text: "Impressum",
              icon: "assets/images/Group 3.png",
              endIcon: "assets/images/Path 54.png",
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final String icon;
  final String endIcon;

  const CustomButton({
    required this.text,
    required this.icon,
    required this.endIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade500,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Image.asset(
                  icon,
                  height: 25,
                  width: 25,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(
              endIcon,
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
