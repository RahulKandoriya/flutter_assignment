import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/cards_screen/card_view.dart';
import 'package:flutter_assignment/data/data.dart';
import '../../utils/shared_pref.dart';

class CardsViewPage extends StatefulWidget {

  final Data data;

  CardsViewPage({Key key, @required this.data}) : super(key: key);

  @override
  _CardsViewPageState createState() => _CardsViewPageState();
}

class _CardsViewPageState extends State<CardsViewPage> {

  Data get data => widget.data;

  int index = 0;

  @override
  void initState() {
    setupLastIndex();
    super.initState();
  }


  void updateIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
    SharePreference.setLastIndex(newIndex);
  }

  void setupLastIndex() async {
    int lastIndex = await SharePreference.getLastIndex();
    if (lastIndex != null && lastIndex < data.vfwImages.length - 1) {
      updateIndex(lastIndex);
    }
  }

  void updateContent(direction) {
    if (index <= 0 && direction == DismissDirection.down) {
      index = data.vfwImages.length - 1;
    } else if (index == data.vfwImages.length - 1 &&
        direction == DismissDirection.up) {
      index = 0;
    } else if (direction == DismissDirection.up) {
      index++;
    } else {
      index--;
    }
    updateIndex(index);
  }

  String getShareText() {
    return "${data.vfwImages[index].fields.name}\n${data.vfwImages[index].fields.url}";
  }

  Widget newsCard(int index) {
    return CardView(
      imgUrl: data.vfwImages[index].fields.url,
      primaryText: data.vfwImages[index].fields.name,
      secondaryText: data.vfwImages[index].fields.url,
      sourceName: data.vfwImages[index].fields.name,
      author: data.vfwImages[index].fields.name,
      publishedAt: data.vfwImages[index].fields.name,
      url: data.vfwImages[index].fields.url,
    );
  }

  @override
  Widget build(BuildContext context) {
    int prevIndex = index <= 0 ? 0 : index - 1;
    int nextIndex = index == data.vfwImages.length - 1 ? 0 : index + 1;
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Cards'),
      ),
      body: Center(
        child: Dismissible(
          background: newsCard(prevIndex),
          child: newsCard(index),
          secondaryBackground: newsCard(nextIndex),
          resizeDuration: Duration(milliseconds: 10),
          key: Key(index.toString()),
          direction: DismissDirection.vertical,
          onDismissed: (direction) {
            updateContent(direction);
          },
        ),
      ),
    );
  }
}