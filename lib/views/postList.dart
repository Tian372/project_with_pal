import 'package:flutter/material.dart';
import 'package:lilivery/providers/userLogin.dart';
import 'package:lilivery/views/post.dart';
import 'package:provider/provider.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (BuildContext context) => Post()));
        },
        child: Text('添加今日菜单'),
      ),
    ));
  }
}
