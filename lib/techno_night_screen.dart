import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TechnoNightScreen extends StatefulWidget {
  const TechnoNightScreen({Key? key}) : super(key: key);

  @override
  State<TechnoNightScreen> createState() => _TechnoNightScreenState();
}

class _TechnoNightScreenState extends State<TechnoNightScreen> {
  bool isFavorite = false;
  GoogleMapController? _controller;
  final LatLng _initialCameraPosition = LatLng(37.7749, -122.4194);
  final List<Map<String, dynamic>> buttonInfo = [
    {'label': '21 km entfernt', 'iconData': Icons.location_on},
    {'label': 'Club', 'iconData': Icons.home},
    {'label': '15€', 'iconData': Icons.euro_symbol},
    {'label': '16-25 Jahre', 'iconData': Icons.accessibility},
    {'label': '<1000', 'iconData': Icons.people},
    {'label': 'Techno', 'iconData': Icons.music_note},
    {'label': 'HipHop', 'iconData': Icons.music_note},
    {'label': 'R&B', 'iconData': Icons.music_note},
  ];

  @override
  Widget build(BuildContext context) {
    final fheight = MediaQuery.of(context).size.height;
    final fwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 110,left: 10,right: 10),
              height: fheight,
              width: fwidth,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMoreEventsImage(),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 1.0,
                      runSpacing: 8,
                      children: buttonInfo.map((info) {
                        return ButtonChip(
                          label: info['label'],
                          iconData: info['iconData'],
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "  Am 21.07.2023 ab 22 Uhr ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Container(
                          height: 1,
                          width: fwidth / 1.10,
                          color: Colors.grey.withOpacity(0.4),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Infos: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Du hast Bock auf Techno? Dann komm nach Ulm und erlebe einen unvergesslichen Abend. Sicher dir am besten jetzt bequem ein Ticket, welches du bis zu 2h vor Einlass stornieren kannst.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              '- DJ Soundstorm\n'
                                  '- Miss Techno Maven\n'
                                  '- ElectroFuse\n'
                                  '- BeatCrafter',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Seid dabei und sichert euch jetzt eure Tickets für die Techno-Nacht des Jahres! Die Nachfrage ist hoch, also zögert nicht zu lange.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 50,
                    ),

                    Center(
                        child: Container(
                          height: 1,
                          width: fwidth / 1.10,
                          color: Colors.grey.withOpacity(0.7),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      width: fwidth,
                      child: GoogleMap(
                        onMapCreated: (GoogleMapController controller) {
                          _controller = controller;
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(37.7749, -122.4194),
                          zoom: 12.0,
                        ),
                      ),

                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Weitere Events dieses Veranstalters: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Image.asset("assets/images/image3.png",
                        height: fheight / 3.5, width: fwidth),
                    SizedBox(height: 20,),
                    Center(
                      child: Text(
                        "Alle Anzeigen ",
                        style: TextStyle(decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.withOpacity(0.5)),
                      ),
                    ),
                    Container(height: 150,)

                  ],
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: MediaQuery.of(context).size.width / 25,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  size: 30,
                  isFavorite ? Icons.favorite : Icons.favorite_outlined,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 95,
                width: fwidth,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
            ),
            Positioned(
                right: fwidth / 1.2,
                top: fheight / 17,
                child: Transform(
                  transform: Matrix4.rotationY(3.141),
                  child: InkWell(
                    child: Image.asset(
                      "assets/images/Path 9.png",
                      height: 25,
                      width: 15,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
            Positioned(
                left: fwidth / 4.1,
                top: fheight / 22,
                child: Image.asset(
                  "assets/images/Techno Night logo.png",
                  height: 50,
                  width: 230,
                  fit: BoxFit.fill,
                )),
            Positioned(
              bottom: 100,
              right: 20,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      // Handle location button tap.
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffff142464), // Changed color
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.location_on,
                        size: 20, // Increased icon size
                        color: Colors.white, // Icon color
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      // Handle share button tap.
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffff142464), // Changed color
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.share,
                        size: 20, // Increased icon size
                        color: Colors.white, // Icon color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: fwidth / 11, // Centered horizontally
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: fwidth/1.18,
                  height: fheight/12,
                  child: Center(
                    child: Image.asset("assets/images/btn_technonight.png")
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMoreEventsImage() {
    return Image(
      image: AssetImage("assets/images/image2.png"),
      height: MediaQuery.of(context).size.height / 4.5,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }
}

class ButtonChip extends StatelessWidget {
  final String label;
  final IconData iconData;

  ButtonChip({required this.label, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Color(0xffff142464),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData, // Use the specified icon
            color: Color(0xffff142464),
            size: 20.0,
          ),
          SizedBox(width: 4.0),
          Text(
            label,
            style: TextStyle(
                color: Color(0xffff142464), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
