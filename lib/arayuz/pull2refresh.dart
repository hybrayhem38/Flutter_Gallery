import 'dart:math';

import 'package:flutter/material.dart';

class Pull2Refresh extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Pull2RefreshState();
}

class Pull2RefreshState extends State<Pull2Refresh> {
  var list;
  var random;

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    random = Random();
    refreshList();
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      list = List.generate(random.nextInt(10), (i) => "Item $i");
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pull to Refresh"),
        ),
        body: RefreshIndicator(
          key: refreshKey,
          child: ListView.builder(
            itemCount: list?.length,
            itemBuilder: (context, i) => ListTile(
                  title: Text(list[i]),
                ),
          ),
          onRefresh: refreshList,
        ));
  }
}
