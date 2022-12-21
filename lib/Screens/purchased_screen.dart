import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class PurchasedScreen extends StatelessWidget {
  final String stockLogo;
  final String stockName;
  final DateTime purchasedDate;
  final double buyPrice;
  final num quantity;

  const PurchasedScreen(
      {super.key,
      required this.stockLogo,
      required this.stockName,
      required this.purchasedDate,
      required this.buyPrice,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockName),
        actions: [],
      ),
      body: Center(
        child: Card(
          child: Container(
            width: 200,
            height: 300,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(stockLogo),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                  ),
                ),
                Text(
                  stockName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text('Quantity: $quantity'),
                Text('@ ₹$buyPrice'),
                const SizedBox(
                  height: 20,
                ),
                Text('Total ammount: ₹${buyPrice * quantity}'),
                const SizedBox(
                  height: 20,
                ),
                Text('Date: ${(DateFormat.yMMMMd().format(purchasedDate))}'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  height: 50,
                  width: 50,
                  child: Image.network(
                    'https://w7.pngwing.com/pngs/680/592/png-transparent-free-content-all-done-s-text-trademark-logo-thumbnail.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
