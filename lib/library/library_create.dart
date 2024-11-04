import '../Constants/design.dart';
import '../ui/model/tracks.dart';
import '../ui/widgets/library_section.dart';
import '../ui/widgets/project_2_track.dart';
import '../ui/widgets/project_track.dart';
import '../ui/widgets/studio/studio.dart';
import 'package:flutter/material.dart';
import '../Constants/color_constants.dart';

class LibraryCreate extends StatefulWidget {
  final VoidCallback onMenuTap;
  List<String> sections;

  LibraryCreate(
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
  State<LibraryCreate> createState() => _LibraryCreateState();
}

class _LibraryCreateState extends State<LibraryCreate> {
  final List<Map> projectTypes = [
    <String, TrackGroup>{
      "Song/Hymn": TrackGroup("Recent Songs", 100, [
        const ProjectTrack(
          content: ["Song Name", "By ", "..."],
          height: 120,
        ),
        const ProjectTrack(
          content: ["Hymn Name", "By ", "..."],
          height: 120,
        ),
        const ProjectTrack(
          content: ["Recording Name", "By ", "..."],
          height: 120,
        ),
        const ProjectTrack(
          content: ["Project Name", "By ", "..."],
          height: 120,
        ),
      ]),
      "Project": TrackGroup("Track Type", 150, [
        const Project2Track(
          content: ["Song", "By ", "..."],
          height: 120,
        ),
        const Project2Track(
          content: ["Hymn", "By ", "..."],
          height: 120,
        ),
        const Project2Track(
          content: ["Recording", "By ", "..."],
          height: 120,
        ),
        const Project2Track(
          content: ["Project", "By ", "..."],
          height: 120,
        ),
      ]),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: bgColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const Material(
                    animationDuration: Duration(milliseconds: 300),
                    child: Studio()),
              ),
            );
          },
          child: const Icon(
            Icons.line_style_rounded,
            color: Colors.white,
          )),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    child: const Icon(Icons.chevron_left, color: Colors.white),
                    onTap: () => Navigator.pop(context),
                  ),
                  const Text("Library - Create/Open Project",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Lucida',
                      )),
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
                    decoration: neoBox(15),
                    child: Column(
                      children: [
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
                                  Icons.add,
                                  size: 45,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                // margin: EdgeInsets.only(
                                //     top: 10,
                                //     bottom: 10,
                                //     left: 5,
                                //     right:
                                //         (MediaQuery.of(context).size.width * 0.95) -
                                //             350),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Create New " +
                                          projectTypes[0].keys.toList()[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Lucida',
                                      ),
                                    ),
                                    const Text(
                                      "using the Studio",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(169, 255, 255, 255),
                                        fontSize: 11,
                                        fontFamily: 'Lucida',
                                      ),
                                    ),
                                  ],
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
                  itemCount: projectTypes[0].keys.toList().length,
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return LibrarySection(
                        sectionTitle:
                            projectTypes[0].values.toList()[index].group,
                        childWidgets:
                            projectTypes[0].values.toList()[index].trackWidget,
                        height: projectTypes[0].values.toList()[index].height);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 15);
                  },
                  itemCount: projectTypes[0].values.toList().length),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
