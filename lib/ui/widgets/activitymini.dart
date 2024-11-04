import 'package:flutter/material.dart';
import '../../../Constants/color_constants.dart';



class ActivityMini extends StatefulWidget {
  const ActivityMini({Key? key}) : super(key: key);

  @override
  State<ActivityMini> createState() => _ActivityMiniState();
}

class _ActivityMiniState extends State<ActivityMini> {
  int _selectedIndex = 0;
  

  @override
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
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Activity",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 57,
          child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _data.length,
              itemBuilder: (context, index) => buildActivity(index)),
        ),
        Row(
          children: [
            Expanded(
              child: Column(children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    // height: 330,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(12),
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
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 5, right: 10, left: 10, bottom: 3),
                              child: const Icon(
                                Icons.thermostat,
                                size: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Container(
                            child: const SizedBox(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10, bottom: 5),
                                child: Text(
                                  _data[_selectedIndex].values.last[0],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    // height: 330,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(12),
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
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 5, right: 10, left: 10, bottom: 3),
                              child: const Icon(
                                Icons.thermostat,
                                size: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Container(
                            child: const SizedBox(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10, bottom: 5),
                                child: Text(
                                  _data[_selectedIndex].values.last[0],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Column(children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(12),
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
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 8, right: 10, left: 10, bottom: 3),
                            child: const Icon(
                              Icons.monitor_heart,
                              size: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 95,
                          height: 95,
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
                              ]),
                          child: const SizedBox(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              child: Text(
                                _data[_selectedIndex].values.last[1],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(12),
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
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 8, right: 10, left: 10, bottom: 3),
                            child: const Icon(
                              Icons.monitor_heart,
                              size: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 95,
                          height: 95,
                          padding: const EdgeInsets.all(5),
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
                              ]),
                          child: const SizedBox(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              child: Text(
                                _data[_selectedIndex].values.last[2],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}


List<dynamic> _data = [
  <String, List<dynamic>>{
    "key": ["Health"],
    "val": [
      "Body Temp",
      "Blood Pressure",
      "Blood Oxygen",
    ],
  },
  <String, List<dynamic>>{
    "key": ["Fitness"],
    "val": ["Workouts", "Courses", "Coaches"],
  },
  <String, List<dynamic>>{
    "key": ["Diet"],
    "val": ["Meal Plans", "Hydration Plan", "Calories"],
  },
  <String, List<dynamic>>{
    "key": ["Socials"],
    "val": ["Vlog", "Blog", "Chat"]
  }
];

