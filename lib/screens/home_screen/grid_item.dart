import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Rahul/StudioProjects/flutter_assignment/lib/screens/cards_screen/cards_view_page.dart';
import 'package:flutter_assignment/data/data.dart';

class GridItem extends StatelessWidget {

  final Data data;
  final int index;

  const GridItem({ Key key, @required  this.data, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CardsViewPage( data: data,)));

      },
      child: Center(
        child: Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 10,),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  data.vfwImages[index].fields.url
                )
              ),
              color: Colors.orangeAccent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350],
                  blurRadius: 8.0, // has the effect of softening the shadow
                  spreadRadius: 3.0, // has the effect of extending the shadow
                  offset: Offset(
                    3.0, // horizontal, move right 10
                    3.0, // vertical, move down 10
                  ),

                )
              ],
              borderRadius: new BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(data.vfwImages[index].fields.name,
                  style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                      ),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}