import '../constants/color_constants.dart';
import '../constants/design.dart';
import '../theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:side_sheet/side_sheet.dart';

class StudioMain extends StatefulWidget {
  const StudioMain({Key? key}) : super(key: key);

  @override
  State<StudioMain> createState() => _StudioMainState();
}

class _StudioMainState extends State<StudioMain> {
  int _currentIndex = 0;
  String filterType = "tracks";
  changeFilter(int filter) {
    _currentIndex = filter;
    setState(() {});
  }

  Widget Tempo() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Tempo",
              style: TextStyle(color: grey, fontSize: 15),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              decoration: neoBox(12),
              margin: const EdgeInsets.all(8),
              height: 150,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: (() {}),
                      icon: const Icon(
                        Icons.add,
                        size: 25,
                        color: white,
                      )),
                ),
                Container(
                  width: 1,
                  height: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade600),
                ),
                const Expanded(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "120",
                        style: TextStyle(fontSize: 40, color: white),
                      ),
                      Text(
                        "Tap Tempo",
                        style: TextStyle(fontSize: 15, color: white),
                      ),
                    ],
                  ),
                )),
                Container(
                  width: 1,
                  height: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade600),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: (() {}),
                      icon: const Icon(
                        Icons.add,
                        size: 25,
                        color: white,
                      )),
                )
              ]),
            ))
          ],
        ),
      ],
    );
  }

  Widget Tracks() {
    return SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TimerTrack('0.00', [1, 1, 1, 1, 1, 1]),
                        Track("Soprano", [1, 1, 1, 1, 1, 1],
                            const Color.fromARGB(200, 255, 82, 82)),
                        Track("Alto", [1, 1, 1, 1, 1, 1],
                            const Color.fromARGB(200, 68, 137, 255)),
                        Track("Tenor", [1, 1, 1, 1, 1, 1],
                            const Color.fromARGB(200, 105, 240, 175)),
                        Track("Bass", [1, 1, 1, 1, 1, 1],
                            const Color.fromARGB(200, 255, 172, 64)),
                      ],
                    ),
                  ),
                ])));
  }

  Widget Lyrics() {
    return SafeArea(
        child: Container(
      height: 500,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: textFieldBackground),
      child: TextField(
        expands: true,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Lyrics",
          labelStyle: TextStyle(color: white.withOpacity(0.3)),
        ),
        style: TextStyle(color: white.withOpacity(0.3)),
        cursorColor: white.withOpacity(0.3),
      ),
    ));
  }

  Widget Settings() {
    return Container(
        child: ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Column(
          children: [
            // Container(width: double.infinity, height: 1, margin: EdgeInsets.symmetric(vertical: 15), decoration: BoxDecoration(color: Colors.grey.shade700),),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Metronome",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(color: Colors.grey.shade700),
            ),
            Tempo(),
            Container(
              width: double.infinity,
              height: 1,
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(color: Colors.grey.shade700),
            ),
          ],
        )
      ],
    ));
  }

  Widget Track(String trackName, List trackData, Color trackColor) {
    return Row(
      children: [
        InkWell(
          child: Container(
            height: 90,
            width: 150,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: textFieldBackground),
            child: Center(
                child: Text(
              trackName,
              style: const TextStyle(fontSize: 15, color: white),
            )),
          ),
        ),
        Container(
          height: 90,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: trackColor),
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 100,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 2),
              itemCount: trackData.length),
        ),
      ],
    );
  }

  Widget TimerTrack(String trackName, List trackData) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 150,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                // topRight: Radius.circular(10),
                bottomLeft: Radius.circular(7),
                // bottomRight: Radius.circular(10)
              ),
              color: textFieldBackground),
          child: Center(
              child: Text(
            trackName,
            style: const TextStyle(fontSize: 15, color: white),
          )),
        ),
        Container(
          color: grey,
          height: 40,
          width: 2,
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                  // bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7)),
              color: textFieldBackground),
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 100,
                );
              },
              separatorBuilder: (BuildContext context, int index) => Container(
                    color: grey,
                    height: 5,
                    width: 2,
                  ),
              itemCount: trackData.length),
        ),
        Container(
          color: grey,
          height: 40,
          width: 2,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [Tracks(), Lyrics(), Settings()];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: (() {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (BuildContext context) => Material(
              //         animationDuration: const Duration(milliseconds: 300),
              //         child: LibraryCreate(onMenuTap: widget.onMenuTap)),
              //   ),
              // );
              Navigator.pop(context);
            }),
            child: const Icon(Icons.chevron_left_rounded, color: Colors.white)),
        title: const Text(
          "Studio",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'Lucida'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.cloud_upload,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      // bottomSheet: BottomSheet(
      //   onClosing: () {},
      //   builder: (context) {
      //     return Scaffold(
      //       backgroundColor: bgColor,
      //       body: Container(
      //         height: 300,
      //         width: 200,
      //         color: Colors.red,
      //       ),
      //       bottomNavigationBar: BottomAppBar(
      //           color: bgColor,
      //           child: Row(children: [
      //             Expanded(
      //               child: IconButton(
      //                 icon: Icon(
      //                   Icons.line_style_outlined,
      //                   size: 30,
      //                   color: Colors.white,
      //                 ),
      //                 onPressed: () {},
      //               ),
      //             )
      //           ])),
      //     );
      //   },
      // ),
      backgroundColor: secondaryColor,
      bottomNavigationBar: BottomAppBar(
        color: bgColor,
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: const Icon(
                  Icons.line_style_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  SideSheet.left(
                      body: Container(
                        color: textFieldBackground,
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 187, right: 50),
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    // width: double.infinity,
                                    height: 90,
                                    decoration: neoBox(7).copyWith(
                                        color: const Color.fromARGB(
                                            200, 255, 82, 82)),
                                  ))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    // width: double.infinity,
                                    height: 90,
                                    decoration: neoBox(7).copyWith(
                                        color: const Color.fromARGB(
                                            200, 68, 137, 255)),
                                  ))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    // width: double.infinity,
                                    height: 90,
                                    decoration: neoBox(7).copyWith(
                                        color: const Color.fromARGB(
                                            200, 105, 240, 175)),
                                  ))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    // width: double.infinity,
                                    height: 90,
                                    decoration: neoBox(7).copyWith(
                                        color: const Color.fromARGB(
                                            200, 255, 172, 64)),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      // width: MediaQuery.of(context).size.width - 50,
                      context: context);
                },
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                icon: const Icon(
                  Icons.skip_previous_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                // padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent, width: 5)),
                child: IconButton(
                  icon: const Icon(
                    Icons.fiber_manual_record_rounded,
                    size: 30,
                    color: Colors.transparent,
                  ),
                  onPressed: () {},
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                icon: const Icon(
                  Icons.play_arrow_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                icon: const Icon(
                  Icons.timer,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            )),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.all(Radius.circular(40)),
          color: secondaryColor,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textFieldBackground),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: (_currentIndex == 0) ? neoBox(7) : null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  changeFilter(0);
                                },
                                child: const Icon(
                                  Icons.blur_linear_sharp,
                                  size: 25,
                                  color: Colors.white,
                                )),
                            // Container(
                            //   height: 4,
                            //   width: 120,
                            //   color: (filterType== "today")?Colors.white:Colors.transparent,
                            // )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: (_currentIndex == 1) ? neoBox(7) : null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  changeFilter(1);
                                },
                                child: const Icon(
                                  Icons.lyrics,
                                  size: 25,
                                  color: Colors.white,
                                )),

                            // Container(
                            //   height: 4,
                            //   width: 120,
                            //   color: (filterType == "monthly")?Colors.white:Colors.transparent,
                            // )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: (_currentIndex == 2) ? neoBox(7) : null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                changeFilter(2);
                              },
                              child: const Icon(
                                Icons.settings,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            // Container(
                            //   height: 4,
                            //   width: 120,
                            //   color: (filterType == "monthly")?Colors.white:Colors.transparent,
                            // )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              tabs[_currentIndex],
              // r
            ],
          ),
        ),
      ),
    );
  }
}
