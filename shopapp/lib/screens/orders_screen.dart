import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routName = '/orders';

  // var _isLoading = false;

  // @override
  // void initState() {
    // Future.delayed(Duration.zero).then((_) async {
    // setState(() {
    // _isLoading = true;
    // });
    /*await*/

    //  Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then((_) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });

    // });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    //print('Building Objects');
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // DO ERROR HANDLING STUFF HERE

            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, _) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, index) =>
                      OrderItem(orderData.orders[index]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
