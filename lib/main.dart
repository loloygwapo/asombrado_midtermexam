import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asombrado_MidtermExam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final List<Item> items = [
    Item(name: 'Mia', details: 'A marksman.'),
    Item(name: 'Layla', details: 'A marksman.'),
    Item(name: 'Ixia', details: 'A marksman.'),
    Item(name: 'Joy', details: 'A mage.'),
    Item(name: 'Khufra', details: 'A tank.'),
    Item(name: 'Grock', details: 'A tank.'),
    Item(name: 'Edith', details: 'A fighter.'),
    Item(name: 'Ruby', details: 'A fighter.'),
    Item(name: 'Yz', details: 'A fighter.'),
    Item(name: 'Arlott', details: 'A fighter.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asombrado_MidtermExam'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(item: items[index]);
        },
      ),
    );
  }
}

class Item {
  final String name;
  final String details;
  bool isAdded = false;

  Item({required this.name, required this.details});
}

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item.isAdded ? const Color.fromARGB(255, 47, 117, 7) : Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.name,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    print(item.details);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    item.isAdded = true;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.name} added!')),
                    );
                    (context as Element).markNeedsBuild();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}