import 'package:flutter/material.dart';

void main() {
  runApp(const MyFitnessDemo());
}

class MyFitnessDemo extends StatelessWidget {
  const MyFitnessDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Fitness Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  bool trainsRegularly = false;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Fitness Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Welcome to My Fitness Demo!',
              style: TextStyle(fontSize: 24),
            ),

            Image.network(
             'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=500',
               height: 200,
            ),
          
            const SizedBox(height: 30),

            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SwitchListTile(
              title: const Text('I train regularly'),
              value: trainsRegularly,
              onChanged: (value) {
                setState(() {
                  trainsRegularly = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      name: nameController.text,
                      trainsRegularly: trainsRegularly,
                    ),
                  ),
                );
              },
              child: const Text ('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}




class ProfilePage extends StatelessWidget {
  final String name;
  final bool trainsRegularly;

  const ProfilePage({
    super.key,
    required this.name,
    required this.trainsRegularly,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $name!',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              trainsRegularly
                  ? 'You train regularly.'
                  : 'You do not train regularly.',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
