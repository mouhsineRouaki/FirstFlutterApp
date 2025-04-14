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
      title: 'myFirstApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nomController =TextEditingController();
 final TextEditingController _ageController =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Entrez votre nom :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
              controller: _nomController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Votre nom',
              ),
              ),
              SizedBox(height: 16),
              Text(
                'Entrez votre âge :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextField(
                controller: _ageController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Votre âge',
                ),
                keyboardType: TextInputType.number,
                ),
                SizedBox(height: 24),
                Center(
                    child: ElevatedButton(
                    onPressed: () {
                    // Traitement des informations
                    String nom = _nomController.text;
                    String age = _ageController.text;

                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                    content: Text('Bonjour $nom, vous avez $age ans.'),
                    ),
                    );
                    },
                    child: Text('Valider'),
                    ),
                ),
          ],
        ),
      ),
    );

  }
  @override
  void dispose() {
    _nomController.dispose();
    _nomController.dispose();
    super.dispose();
  }
    
}
