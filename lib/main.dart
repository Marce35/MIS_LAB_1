import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '213280',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> clothes = [
    {
      'name': 'T-Shirt',
      'image': 'assets/images/t-shirt.jpg',
      'description': 'A comfortable cotton T-shirt.',
      'price': '\$20',
    },
    {
      'name': 'Jeans',
      'image': 'assets/images/jeans.jpg',
      'description': 'Stylish blue jeans.',
      'price': '\$40',
    },
    {
      'name': 'Jacket',
      'image': 'assets/images/jacket.png',
      'description': 'A warm winter jacket.',
      'price': '\$100',
    },
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("213280")),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          final item = clothes[index];
          return Card(
            child: ListTile(
              title: Text(item['name']!),
              leading: SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(
                  item['image']!,
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, String> item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  item['image']!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(item['description']!),
            const SizedBox(height: 16),
            Text(
              item['price']!,
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
