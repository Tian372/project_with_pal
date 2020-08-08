import 'package:flutter/material.dart';
import 'package:lilivery/providers/userLogin.dart';
import 'package:provider/provider.dart';

class OrderView extends StatefulWidget {
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userLogin = Provider.of<UserLogin>(context);
    return Scaffold(body: Container(
      child: orderHistory(),
    ));

  }

  Widget orderHistory() {

    Future<List<String>> myTypedFuture() async {
      await Future.delayed(Duration(seconds: 2));
      List<String> list = new List<String>();
      for (int i = 0; i < 10; i++) {
        list.add('Order History: ' + i.toString());
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
