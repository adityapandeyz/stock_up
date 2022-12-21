import 'package:flutter/material.dart';
import 'package:stock_up/Screens/purchased_screen.dart';

import '../models/company.dart';
import '../widgets/popover.dart';

class Stock extends StatefulWidget {
  final String name;
  final String email;
  const Stock({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  final _quantityController = TextEditingController();

  final List<Company> _company = [
    Company(
      'https://upload.wikimedia.org/wikipedia/commons/9/94/Boat_Logo.webp',
      'Imagine Marketing Ltd',
      100000,
      9000,
      466,
      400,
      50,
      1.8,
      2,
    ),
    Company(
      'https://assets.upstox.com/content/dam/aem-content-integration/assets/images/logos/ADANIENT/ADANIENT.png',
      'Adani Enterprises Ltd',
      153000,
      12000,
      4000,
      3909.00,
      60,
      5.6,
      3,
    ),
    Company(
      'https://couravel.com/wp-content/uploads/2017/09/tata-steel-logo.jpg',
      'Tata Steel Limited',
      160000,
      10100,
      110,
      109.6,
      30,
      0.08,
      2,
    ),
    Company(
      'https://i.pinimg.com/originals/de/64/63/de646309009817507baf01587f107106.png',
      'Reliance Industries Ltd',
      163010,
      53453,
      2583.20,
      2583.20,
      50,
      0.00,
      2,
    ),
    Company(
      'https://zerocreativity0.files.wordpress.com/2017/01/himalaya-logo.jpg',
      'Himalaya Food International Ltd',
      176010,
      46454,
      26.60,
      24.60,
      50,
      2.00,
      3,
    ),
    Company(
      'https://m.economictimes.com/thumb/msid-87318851,width-1200,height-900,resizemode-4,imgsize-70241/itc.jpg',
      'ITC Ltd',
      283110,
      96414,
      400.0,
      335.70,
      60,
      20.00,
      3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Stock Up'),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _company.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(_company[index].logo),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                        ),
                      ),
                      title: Text(
                        _company[index].name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Available Quantity: ${_company[index].avQuantity}',
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            'MPQ: ${_company[index].mpq}  ATS: ${_company[index].ats} Weaks',
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            'MRP: ₹${_company[index].mrp} Buy Price: ₹${_company[index].buyPrice}',
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            'Profit: ${_company[index].profit} %',
                            style: const TextStyle(
                                fontSize: 10, color: Colors.green),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<int>(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Popover(
                                  child: Column(
                                    children: [
                                      Text('Stock: ${_company[index].name}'),
                                      Text(
                                          'Buy Price: ₹${_company[index].buyPrice}'),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20),
                                        child: TextFormField(
                                          autofocus: true,
                                          controller: _quantityController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Quantity',
                                            contentPadding:
                                                const EdgeInsets.all(20.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => PurchasedScreen(
                                              stockLogo: _company[index].logo,
                                              stockName: _company[index].name,
                                              buyPrice:
                                                  _company[index].buyPrice,
                                              purchasedDate: DateTime.now(),
                                              quantity: double.parse(
                                                  _quantityController.text),
                                            ),
                                          ),
                                        ),
                                        child: Text('Done'),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text('Buy'),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
