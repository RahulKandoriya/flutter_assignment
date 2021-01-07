import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String url,
      imgUrl,
      primaryText,
      secondaryText,
      sourceName,
      author,
      publishedAt;

  CardView(
      {this.url,
        this.imgUrl,
        this.primaryText,
        this.secondaryText,
        this.sourceName,
        this.author,
        this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              color: Colors.grey.withOpacity(0.2),
              child: Image.network(
                imgUrl,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Text(
                primaryText,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  secondaryText,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
                child: Text(
                  "swipe left for more at",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.grey),
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox( width: 10,),
                  Text(
                    primaryText,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}