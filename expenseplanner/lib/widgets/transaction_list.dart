import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;

  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transaction Added Yet',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(
                transaction: transactions[index],
                deleteTx: deletetx,
              );

              },
              itemCount: transactions.length,
            ),
    );
  }
}

//  return Card(
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         margin:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Theme.of(context).primaryColorDark,
//                             width: 2,
//                           ),
//                         ),
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           '\₹${transactions[index].amount.toStringAsFixed(2)}', //String Interpolation
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Theme.of(context).primaryColorDark,
//                           ),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             transactions[index].title,
//                             style: Theme.of(context).textTheme.title,
//                           ),
//                           Text(
//                             DateFormat.yMMMd().format(transactions[index].date),
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 );
