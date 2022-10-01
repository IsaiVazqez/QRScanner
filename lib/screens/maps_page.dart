import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (_, i) => ListTile(
              leading: Icon(CupertinoIcons.map_fill,
                  color: Theme.of(context).primaryColor),
              title: Text('asdasd'),
              subtitle: Text('asdasda'),
              trailing: Icon(CupertinoIcons.arrow_right,
                  color: Theme.of(context).primaryColor),
              onTap: () {},
            ));
  }
}
