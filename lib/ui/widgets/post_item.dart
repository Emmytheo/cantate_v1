import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class PostItem extends StatelessWidget {
  final String profileImg;
  final String name;
  final String postImg;
  final String caption;
  final isLoved;
  final String likedBy;
  final String viewCount;
  final String dayAgo;
  const PostItem({
    Key? key, required this.profileImg, required this.name, required this.postImg, this.isLoved, required this.likedBy, required this.viewCount, required this.dayAgo, required this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // border: Border(
        //     top: BorderSide(width: 1.0, color: Colors.white.withOpacity(0.4)),
        //     bottom: BorderSide(width: 1.0, color: Colors.white.withOpacity(0.4)),
        // )
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(profileImg),fit: BoxFit.cover)
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Text(name,style: const TextStyle(
                    color: white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),)
                  ],),
                  // Icon(LineIcons.ellipsis_h,color: white,)
                ],
              ),
            ),
            const SizedBox(height: 12,),
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(postImg),fit: BoxFit.cover)
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                children: <Widget>[
                  isLoved 
                    // ? SvgPicture.asset("assets/images/loved_icon.svg",width: 27,)
                    // : SvgPicture.asset("assets/images/love_icon.svg",width: 27,),
                    ? const InkWell( child: Icon(Icons.thumb_up_sharp, color: Colors.blueAccent, size: 27),)
                    : InkWell( child: Icon(Icons.thumb_up_alt_outlined, color: Colors.white.withOpacity(0.8), size: 27),),
                  const SizedBox(width: 20,),
                  InkWell( child: Icon(Icons.chat_bubble_outline, color: Colors.white.withOpacity(0.8), size: 27),),
                    const SizedBox(width: 20,),
                  InkWell( child: Icon(Icons.share, color: Colors.white.withOpacity(0.8), size: 27),),
                ],
              ),
              InkWell( child: Icon(Icons.bookmark_border_outlined, color: Colors.white.withOpacity(0.8), size: 27),),
                ],
              ),
            ),
            const SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: RichText(text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Liked by ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  TextSpan(
                    text: "$likedBy ",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    )
                  ),
                  const TextSpan(
                    text: "and ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  const TextSpan(
                    text: "Others",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    )
                  ),
                  
                ]
              )),
            ),
            const SizedBox(height: 12,),
            Padding(padding: const EdgeInsets.only(left: 15,right: 15),
            child: RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "$name ",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    )
                  ),
                  TextSpan(
                    text: caption,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    )
                  ),

                ]
              ))),
              const SizedBox(height: 12,),
              Padding(padding: const EdgeInsets.only(left: 15,right: 15),
              child: Text("View $viewCount comments",style: TextStyle(
                color: white.withOpacity(0.5),
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),),
              ),
              const SizedBox(height: 12,),
              Padding(padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(profileImg),fit: BoxFit.cover)
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Text("Add a comment...",style: TextStyle(
                color: white.withOpacity(0.5),
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),),
                ],
              ),
              Row(
                children: <Widget>[
                  const Text("😂",style: TextStyle(
                    fontSize: 
                    20
                  ),),
                  const SizedBox(width: 10,),
                  const Text("😍",style: TextStyle(
                    fontSize: 
                    20
                  ),),
                   const SizedBox(width: 10,),
                   Icon(Icons.add_circle,color: white.withOpacity(0.5),size: 18,)
                ],
              )
                ],
              )
              ),
              const SizedBox(height: 12,),
              Padding(padding: const EdgeInsets.only(left: 15,right: 15),
              child:  Text(dayAgo,style: TextStyle(
                color: white.withOpacity(0.5),
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),),
              ),
              const SizedBox(height: 12,),
              Divider(
                color: white.withOpacity(0.3),
              ),
          ],
        ),
      ),
    );
  }
}