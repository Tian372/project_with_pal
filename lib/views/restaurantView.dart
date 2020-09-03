import 'package:flutter/material.dart';
import 'package:lilivery/providers/userLogin.dart';
import 'package:provider/provider.dart';

class RestaurantView extends StatefulWidget {
  @override
  _RestaurantViewState createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userLogin = Provider.of<UserLogin>(context);
    return SafeArea(
        child: Container(
      child: restaurantsList(),
    ));
  }

  Widget restaurantsList() {
    Future<List<String>> myTypedFuture() async {
      await Future.delayed(Duration(seconds: 2));
      List<String> list =
          new List<String>.generate(8, (index) => 'Task $index');
      return list;
    }

    return FutureBuilder(
      future: myTypedFuture(),
      builder: (context, snapshot) {
        //TODO: fix dismissed
        List<String> list = new List<String>();
        if(snapshot.hasData){
          list =  snapshot.data;
        }
        return snapshot.hasData
            ? ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.black26,
                      thickness: 1,
                    ),
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: new Key(list[index]),
                    background: new Container(
                      color: Colors.red,
                    ),
                    onDismissed: (direction){
                      Scaffold.of(context).showSnackBar(
                        new SnackBar(content: new Text("Removed"))
                      );
                      list.remove(list[index]);
                    },
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      child: Center(
                        child: ListTile(
                          title: Text(list[index]),
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
