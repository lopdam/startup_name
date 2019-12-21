import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
//import 'package:startup_name/screens/home.dart';

class Likes extends StatefulWidget {
  Set<WordPair> _saved = {};

  Likes(this._saved) : super();

  @override
  LikesSate createState() {
    return LikesSate(_saved);
  }
}

class LikesSate extends State<Likes> {
  Set<WordPair> _saved = {};
  Iterable<ListTile> tiles;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  LikesSate(Set<WordPair> _saved) {
    this._saved=_saved;
    this.tiles = this._saved.map(
      (WordPair pair) {
        final bool alreadySaved = this._saved.contains(pair);
        return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
            ),
            onTap: () {
              setState(() {
                this._saved.remove(pair);
              });
            });
      },
    );
  }
  void _pushSaved() {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      // Add 6 lines from here...
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            title: Text(''),
          ),
        ],
        onTap: (index){
          if(index==0){
            _pushSaved();
          }
        },
      ),
    );
  }
}
