import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> chipLabels = [
    "Wann",
    "Bevorzugte Entfernung",
    "Location",
    "Musik",
    "Eintritt",
    "Durchschnittliches Alter",
    "Durchschnittliche Besucheranzahl",
  ];

  List<List<String>> chipOptions = [
    ["Heute", "Morgen", "Datum wählen"],
    ["21 km"],
    [
      "Bar",
      "Bierzelt",
      "Bude",
      "Club",
      "Disco",
      "Hausparty",
      "Festhalle",
      "Festhalle",
      "Pool-Party"
    ],
    [
      "HipHop",
      "Rave",
      "House",
      "Deutschrap",
      "Amirap",
      "Techno",
      "Dance",
      "R&B"
    ],
    ["Kostenlos", "1-5€", "6-10€", "11-15€", "16€+"],
    ["16-25", "26-35", "36-45", "46-55", "56-65"],
    [
      "1-15",
      "20-50",
      "60-100",
      "150-300",
      "350-700",
      "700-1000",
      "1200-2000",
      "2000+"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    List<List<bool>> chipSelected = List.generate(7,
        (index) => List.generate(chipOptions[index].length, (index) => false));
    final fheight = MediaQuery.of(context).size.height;
    final fwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: fheight,
          width: fwidth,
          child: Stack(children: [
            Positioned(
              child: Container(
                height: 95,
                width: fwidth / 0.5,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
            ),
            Positioned(
                left: fwidth / 2.5,
                top: fheight / 25,
                child: Image.asset(
                  "assets/images/filterlogo.png",
                  height: 100,
                  width: 100,
                )),
            Positioned(
              left: fwidth / 1.7,
              top: fheight / 23,
              child: Container(
                margin: EdgeInsets.only(left: 80, top: 15),
                child: Text(
                  "Fertig",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 92),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // Add empty space before the content
                      Padding(
                        padding: const EdgeInsets.only(top: 0, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int index = 0;
                                index < chipLabels.length;
                                index++)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Text(
                                          chipLabels[index],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffff142464),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: index == 1 ? true : false,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 80, top: 15),
                                          child: Text(
                                            "Datum wählen",
                                            style: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: index == 2 ? true : false,
                                        child: Container(
                                          margin: EdgeInsets.only(right: 70),
                                          child: Text(
                                            "21 km",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  if (index == 0) ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        for (int i = 0;
                                            i < chipOptions[index].length;
                                            i++)
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                chipSelected[index][i] =
                                                    !chipSelected[index][i];
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 0, top: 10, right: 10),
                                              child: Chip(
                                                label: Text(
                                                  chipOptions[index][i],
                                                  style: TextStyle(
                                                    color: chipSelected[index]
                                                            [i]
                                                        ? Colors.white
                                                        : Color(0xffff142464),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    chipSelected[index][i]
                                                        ? Color(0xffff142464)
                                                        : Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    color: Color(0xffff142464),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                  ] else if (index == 1) ...[
                                    Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 400,
                                          child: SliderTheme(
                                            data: SliderTheme.of(context)
                                                .copyWith(
                                              trackHeight: 8.0,
                                              thumbShape: RoundSliderThumbShape(
                                                enabledThumbRadius: 15.0,
                                              ),
                                            ),
                                            child: Slider(
                                              inactiveColor:
                                                  Colors.grey.withOpacity(0.5),
                                              value: 21.0,
                                              min: 0,
                                              max: 100,
                                              onChanged: (value) {
                                                setState(() {
                                                  // Update the value as needed.
                                                });
                                              },
                                              activeColor: Color(0xffff142464),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ] else ...[
                                    Wrap(
                                      children: [
                                        for (int i = 0;
                                            i < chipOptions[index].length;
                                            i++)
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                chipSelected[index][i] =
                                                    !chipSelected[index][i];
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 0, right: 10),
                                              child: Chip(
                                                label: Text(
                                                  chipOptions[index][i],
                                                  style: TextStyle(
                                                    color: chipSelected[index]
                                                            [i]
                                                        ? Color(0xffff142464)
                                                        : Colors.grey
                                                            .withOpacity(0.5),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    chipSelected[index][i]
                                                        ? Color(0xffff142464)
                                                        : Colors.grey
                                                            .withOpacity(0.2),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    color: Colors.black26,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                      )
                    ],
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
