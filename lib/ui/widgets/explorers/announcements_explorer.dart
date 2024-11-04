import '../../../Constants/design.dart';
import '../../../theme/colors.dart';
import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';


class AnnoucementsExplorer extends StatefulWidget {
  final String type;

  const AnnoucementsExplorer({Key? key, required this.type}) : super(key: key);

  @override
  State<AnnoucementsExplorer> createState() => _AnnoucementsExplorerState();
}

class _AnnoucementsExplorerState extends State<AnnoucementsExplorer> {
  int _selectedIndex = 0;

  @override
  Widget fitnessRow(int index) {
    return GestureDetector(
      onTap: () {},
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
                  ]),
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
                      ]),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget songRow(int index) {
    const double height = 60;
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: height,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.all(12),
              decoration: neoBox(10),
              child: Row(children: [
                Container(
                  height: double.infinity,
                  width: height - 20,
                  // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  margin: const EdgeInsets.only(right: 12),
                  // decoration: neoBox(10),
                  child: const Icon(
                    Icons.announcement_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget hymnRow(int index) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.all(12),
              decoration: neoBox(10),
              child: Row(children: [
                Container(
                  height: double.infinity,
                  width: 40,
                  // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  margin: const EdgeInsets.only(right: 12),
                  decoration: neoBox(10),
                  child: const Icon(
                    Icons.music_note,
                    size: 30,
                    color: Colors.white,
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
      onTap: () {},
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
                  ]),
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
          margin: const EdgeInsets.all(8),
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

  Widget Songs() {
    return Container(
      child: Column(
        children: [
          ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _data.length + 10,
              itemBuilder: (context, index) => songRow(index)),
        ],
      ),
    );
  }

  Widget Hymns() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 420,
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                // shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _data.length + 10,
                itemBuilder: (context, index) => hymnRow(index)),
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
    List<Widget> tabs = [];
    switch (widget.type) {
      case "songs":
        tabs = [Songs(), Songs(), Songs(), Songs()];
        break;

      case "hymns":
        tabs = [Songs(), Songs(), Songs(), Songs()];
        break;
      default:
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: const Text(
                        "Sorting: ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 2,
                    ),
                    child: const Text(
                      "Relevant",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                      onPressed: (() {}),
                      iconSize: 25,
                      icon: const Icon(
                        Icons.sort_rounded,
                        color: Colors.white,
                      )),
                ),
              ],
            ))
          ],
        ),
        const SizedBox(height: 5),
        SafeArea(
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: textFieldBackground),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: white.withOpacity(0.3),
                      ),
                      // suffixIcon: Icon(
                      //   Icons.history,
                      //   color: white.withOpacity(0.3),
                      // )
                    ),
                    style: TextStyle(color: white.withOpacity(0.3)),
                    cursorColor: white.withOpacity(0.3),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 50,
          child: Row(children: [
            Expanded(child: buildActivity(0)),
            Expanded(child: buildActivity(1)),
          ]),
        ),

        // SizedBox(
        //   height: 50,
        //   child: ListView.separated(
        //     shrinkWrap: true,
        //     scrollDirection: Axis.horizontal,
        //     physics: ClampingScrollPhysics(),
        //     itemBuilder: (context, index) => buildActivity(index),
        //     separatorBuilder: (context, index) {
        //       return SizedBox(
        //         width: 1,
        //       );
        //     },
        //     itemCount: _data.length,
        //   ),
        // ),
        const SizedBox(
          height: 5,
        ),
        tabs[_selectedIndex],
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

List<dynamic> _data = [
  <String, List<dynamic>>{
    "key": ["Urgent"],
    "val": [
      "Body Temp",
      "Blood Pressure",
      "Blood Oxygen",
    ],
  },
  <String, List<dynamic>>{
    "key": ["General"],
    "val": ["Workouts", "Courses", "Coaches"],
  },
];
