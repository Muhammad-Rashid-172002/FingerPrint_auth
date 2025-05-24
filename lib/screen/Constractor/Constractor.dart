import 'package:figerprint/screen/Constractor/secondScreen.dart';
import 'package:flutter/material.dart';

class ConstractorScreen extends StatefulWidget {
  const ConstractorScreen({super.key});

  @override
  State<ConstractorScreen> createState() => _ConstractorScreenState();
}

class _ConstractorScreenState extends State<ConstractorScreen> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Constractor'), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                hintText: 'Name',
                prefixIcon: const Icon(Icons.person),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    nameController.clear();
                  },
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => Secondscreen(name: nameController.text),
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
