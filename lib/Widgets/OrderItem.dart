import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Provider/Orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '₹${widget.order.amount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              DateFormat('dd-MM-yyy').format(widget.order.dateTime),
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          Visibility(
            visible: _expanded,
            child: Column(
              children: [
                Divider(),
                DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('Product'),
                    ),
                    DataColumn(
                      label: Text('Quantity'),
                    ),
                    DataColumn(
                      label: Text('Price'),
                    ),
                  ],
                  rows: widget.order.products
                      .map(
                        (prod) => DataRow(
                          cells: [
                            DataCell(
                              Text('${prod.title}'),
                            ),
                            DataCell(
                              Text('${prod.quantity}'),
                            ),
                            DataCell(
                              Text('₹${prod.price.toStringAsFixed(2)}'),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  dataTextStyle: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
