import '../Constants/design.dart';
import '../ui/model/tracks.dart';
import '../ui/widgets/library_section.dart';
import 'package:flutter/material.dart';
import '../Constants/color_constants.dart';

class LibraryHome extends StatefulWidget {
  final VoidCallback onMenuTap;
  List<String> sections;

  LibraryHome(
      {Key? key,
      required this.onMenuTap,
      this.sections = const [
        "Recent",
        "Featured",
        "Popular",
        "Seasons",
      ]})
      : super(key: key);

  @override
  State<LibraryHome> createState() => _LibraryHomeState();
}

class _LibraryHomeState extends State<LibraryHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: secondaryColor,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                    onTap: widget.onMenuTap,
                    child: const Icon(Icons.menu, color: Colors.white)),
                const Text("Library",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const Icon(Icons.settings, color: Colors.transparent),
              ],
            ),
            const SizedBox(height: 20),
            // Container(
            //   padding: EdgeInsets.all(5),
            //   margin: EdgeInsets.all(5),
            //   height: 65,
            //   child: ListView.separated(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: ClampingScrollPhysics(),
            //       itemBuilder: (context, index) {
            //         return Container(
            //           padding: EdgeInsets.all(8),
            //           margin: EdgeInsets.all(8),
            //           decoration: neoBox(12),
            //           child: SizedBox(width: 100,),
            //         );
            //       },
            //       separatorBuilder: (context, index) {
            //         return SizedBox(width: 10,);
            //       },
            //       itemCount: 20),
            // ),
            const SizedBox(height: 5),
            SizedBox(
              height: 150,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.95),
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(8),
                  decoration: neoBox(12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 7,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: Colors.orangeAccent),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: neoBox(50),
                            child: const Center(
                              child: Icon(
                                Icons.music_note,
                                size: 45,
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // margin: EdgeInsets.only(
                              //     top: 10,
                              //     bottom: 10,
                              //     left: 10,
                              //     right:
                              //         (MediaQuery.of(context).size.width * 0.95) -
                              //             280),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Song Name",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Lucida',
                                    ),
                                  ),
                                  Text(
                                    "Genre, Composer",
                                    style: TextStyle(
                                      color: Color.fromARGB(169, 255, 255, 255),
                                      fontSize: 11,
                                      fontFamily: 'Lucida',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                            decoration: neoBox(180),
                            padding: const EdgeInsets.all(5),
                            child: const Center(
                              child: Icon(
                                Icons.play_arrow,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                itemCount: 4,
              ),
            ),
            const SizedBox(height: 20),
            ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return LibrarySection(
                      sectionTitle: tracks[index].group,
                      childWidgets: tracks[index].trackWidget,
                      height: tracks[index].height);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
                itemCount: tracks.length),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
