import 'package:flutter/material.dart';


class LibrarySection extends StatelessWidget {
  // final VoidCallback onMenuTap;
  final String sectionTitle;
  final double height;
  final List<Widget> childWidgets;

  const LibrarySection(
      {Key? key,
      // required this.onMenuTap,
      required this.sectionTitle,
      required this.childWidgets,
      required this.height
      }
      )
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              sectionTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Lucida',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            height: height,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return childWidgets[index];
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: childWidgets.length),
          ),
        ]);
  }
}


