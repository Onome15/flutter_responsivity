import 'package:app/responsive_helper.dart';
import 'package:flutter/material.dart';

class Products {
  final String name;
  final String price;
  final String quantity;
  final String sold;

  Products(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.sold});
}

// ignore: use_key_in_widget_constructors

List<Products> products = [
  Products(
      name: 'Samsung S24 Ultra', price: '\$927', quantity: '84', sold: '72'),
  Products(
      name: 'Xiaomi 14 Ultra', price: '\$1,065', quantity: '197', sold: '39'),
  Products(
      name: 'Iphone 16pro max', price: '\$1,099', quantity: '62', sold: '81'),
  Products(name: 'Oneplus 12', price: '\$659', quantity: '172', sold: '27'),
  // Add more products here
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Products List App',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Phone List'),
            ),
            body: Responsive(
                tab: Align(alignment: Alignment.topCenter, child: table()),
                mobile: Flexible(
                  // flex: 1,
                  child: listView(),
                ))));
  }

  ListView listView() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text("Name: ${products[index].name}"),
                subtitle: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Aligns text to the left
                  children: [
                    Text("Price: ${products[index].price}"),
                    Text("Quantity: ${products[index].quantity}"),
                    Text("Sold: ${products[index].sold}"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  DataTable table() {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('Sold(%)')),
      ],
      rows: products.map((contact) {
        return DataRow(cells: [
          DataCell(Text(contact.name)),
          DataCell(Text(contact.price)),
          DataCell(Text(contact.quantity)),
          DataCell(Text(contact.sold)),
        ]);
      }).toList(),
    );
  }
}
