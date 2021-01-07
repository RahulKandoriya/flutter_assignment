import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Rahul/StudioProjects/flutter_assignment/lib/data/api.dart';
import 'package:flutter_assignment/data/data.dart';
import 'file:///C:/Users/Rahul/StudioProjects/flutter_assignment/lib/screens/home_screen/grid_item.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  Future<Data> futureData;


  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: FutureBuilder<Data>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 3,
                childAspectRatio: (itemWidth / itemHeight),
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List.generate(snapshot.data.vfwImages.length, (index) {
                  return GridItem( data: snapshot.data, index: index,);
                }),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

}