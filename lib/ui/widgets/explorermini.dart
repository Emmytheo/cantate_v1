import '../../../Constants/design.dart';
import '../../../theme/colors.dart';
import 'package:flutter/material.dart';
import '../../../Constants/color_constants.dart';


class ExplorerMini extends StatefulWidget {
  const ExplorerMini({Key? key}) : super(key: key);

  @override
  State<ExplorerMini> createState() => _ExplorerMiniState();
}

class _ExplorerMiniState extends State<ExplorerMini> {
  int _selectedIndex = 0;

  @override
  Widget fitnessRow(int index) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black,
                            offset: Offset(3, 3),
                            blurRadius: 10,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.grey.shade800,
                            offset: const Offset(-3, -3),
                            blurRadius: 10,
                            spreadRadius: 1),
                      ]
                  ),
                  child: Row(children: [
                    Container(
                      height: double.infinity,
                      width: 80,
                      // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.black,
                                offset: Offset(3, 3),
                                blurRadius: 10,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.grey.shade800,
                                offset: const Offset(-3, -3),
                                blurRadius: 10,
                                spreadRadius: 1),
                          ]
                      ),  
                    )
                  ]),
                ),
              ),
            ],
          ),
    );
  }

  Widget dietRow(int index) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black,
                            offset: Offset(3, 3),
                            blurRadius: 10,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.grey.shade800,
                            offset: const Offset(-3, -3),
                            blurRadius: 10,
                            spreadRadius: 1),
                      ]
                  ),
                  child: Row(children: [
                    Container(
                      height: double.infinity,
                      width: 80,
                      // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.black,
                                offset: Offset(3, 3),
                                blurRadius: 10,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.grey.shade800,
                                offset: const Offset(-3, -3),
                                blurRadius: 10,
                                spreadRadius: 1),
                          ]
                      ),  
                    )
                  ]),
                ),
              ),
            ],
          ),
    );
  }

  Widget socialRow(int index) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black,
                            offset: Offset(3, 3),
                            blurRadius: 10,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.grey.shade800,
                            offset: const Offset(-3, -3),
                            blurRadius: 10,
                            spreadRadius: 1),
                      ]
                  ),
                  child: const Row(children: [
                    // Container(
                    //   height: double.infinity,
                    //   width: 80,
                    //   // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    //   margin: EdgeInsets.only(right: 12),
                    //   decoration: BoxDecoration(
                    //       color: secondaryColor,
                    //       borderRadius: BorderRadius.circular(10),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: Colors.black,
                    //             offset: Offset(3, 3),
                    //             blurRadius: 10,
                    //             spreadRadius: 1),
                    //         BoxShadow(
                    //             color: Colors.grey.shade800,
                    //             offset: Offset(-3, -3),
                    //             blurRadius: 10,
                    //             spreadRadius: 1),
                    //       ]
                    //   ),  
                    // )
                  ]),
                ),
              ),
            ],
          ),
    );
  }

  Widget buildActivity(int index) {
    return GestureDetector(
        onTap: () => {
              // print((MediaQuery.of(context).size.width * 0.95) - 300),
              // print(_data[index].values.first.toString().substring(1, _data[index].values.first.toString().length - 1)),
              setState(() {
                _selectedIndex = index;
              })
            },
        child: Container(
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              color: _selectedIndex == index ? secondaryColor : null,
              borderRadius: BorderRadius.circular(7),
              boxShadow: _selectedIndex == index
                  ? [
                      const BoxShadow(
                          color: Colors.black,
                          offset: Offset(3, 3),
                          blurRadius: 10,
                          spreadRadius: 1),
                      BoxShadow(
                          color: Colors.grey.shade800,
                          offset: const Offset(-3, -3),
                          blurRadius: 10,
                          spreadRadius: 1),
                    ]
                  : null),
          child: Text(
              _data[index].values.first.toString().substring(
                  1, _data[index].values.first.toString().length - 1),
              style: const TextStyle(color: Colors.white, fontSize: 14)),
        ));
  }

  Widget Health() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(children: [
              Container(
                width: double.infinity,
                height: 330,
                // margin: EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 130,
                              // child: Icon(
                              //   Icons.thermostat,
                              //   size: 20,
                              //   color: Colors.white,
                              // ),
                              margin: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 8),
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: neoBox(12)
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        child: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                                height: 130,
                                margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 15),
                              //   child: Icon(
                              //   Icons.thermostat,
                              //   size: 20,
                              //   color: Colors.white,
                              // ),
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                decoration: neoBox(12)
                                  ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                // decoration: neoBox(12)
              ),
            ]),
          ),
          Expanded(
            child: Column(children: [
              Container(
                width: double.infinity,
                height: 330,
                // margin: EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 130,
                              // child: Icon(
                              //   Icons.thermostat,
                              //   size: 20,
                              //   color: Colors.white,
                              // ),
                              margin: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 8),
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: neoBox(12)
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        child: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                                height: 130,
                                margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 15),
                              //   child: Icon(
                              //   Icons.thermostat,
                              //   size: 20,
                              //   color: Colors.white,
                              // ),
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                decoration: neoBox(12)
                                  ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                // decoration: neoBox(12)
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget Fitness() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 380,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              // shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _data.length,
              itemBuilder: (context, index) => fitnessRow(index)),
          ),
          
        
        ],
      ),
    );
  }

  Widget Diet() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 380,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              // shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _data.length,
              itemBuilder: (context, index) => dietRow(index)),
          ),
          
        
        ],
      ),
    );
  }

  Widget Social() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 380,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              // shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _data.length,
              itemBuilder: (context, index) => socialRow(index)),
          ),
          
        
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [Health(), Fitness(), Diet(), Social()];
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Explore",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),

        Container(
          // height: 50,
          margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: textFieldBackground),
          child: SizedBox(
            height: 55,
            child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _data.length,
                itemBuilder: (context, index) => buildActivity(index)),
          ),
        ),
        tabs[_selectedIndex]
      ],
    );
  }
}

List<dynamic> _data = [
  <String, List<dynamic>>{
    "key": ["Social"],
    "val": [
      "Body Temp",
      "Blood Pressure",
      "Blood Oxygen",
    ],
  },
  <String, List<dynamic>>{
    "key": ["Chats"],
    "val": ["Workouts", "Courses", "Coaches"],
  },
  <String, List<dynamic>>{
    "key": ["Events"],
    "val": ["Meal Plans", "Hydration Plan", "Calories"],
  },
  <String, List<dynamic>>{
    "key": ["Music"],
    "val": ["Vlog", "Blog", "Chat"]
  }
];
