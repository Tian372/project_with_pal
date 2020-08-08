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
    return Scaffold(body: Container(
      child: restaurantsList(),
    ));

  }

  Widget restaurantsList() {

    Future<List<String>> myTypedFuture() async {
      await Future.delayed(Duration(seconds: 2));
      List<String> list = new List<String>();
      for (int i = 0; i < 10; i++) {
        list.add('Restaurant ' + i.toString());
      }
      return list;
    }

    return FutureBuilder(
      future: myTypedFuture(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.black26,
                      thickness: 1,
                    ),
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    child: Center(
                      child: Text(snapshot.data[index]),
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
