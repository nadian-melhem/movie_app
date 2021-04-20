import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecTap extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Texto $index");

  @override
  _RecTap createState() => _RecTap();
}

class _RecTap extends State<RecTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: Search(widget.list));
              })
        ],
        centerTitle: true,
        title: Text("Search Bar"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(
                  widget.list[index],
                ),
              )),
    );
  }
}

class Search extends SearchDelegate {
  final List<String> listExample;

  String selectedResult;
  Search(this.listExample);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  List<String> recentList = ["t1", "t2"];
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList
            .addAll(listExample.where((element) => element.contains(query)));
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestionList[index]),
            onTap: () {
              this.selectedResult = suggestionList[index];
              showResults(context);
            },
          );
        });
  }
}
