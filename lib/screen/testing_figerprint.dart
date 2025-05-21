import 'package:figerprint/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class TestingFigerprint extends StatefulWidget {
  const TestingFigerprint({super.key});

  @override
  State<TestingFigerprint> createState() => _TestingFigerprintState();
}

class _TestingFigerprintState extends State<TestingFigerprint> {
  final LocalAuthentication authentication = LocalAuthentication();
  SetState() {
    super.initState();
    authWithFingerprint();
  }

  Future<void> authWithFingerprint() async {
    try {
      bool authenticated = await authentication.authenticate(
        localizedReason: 'Please authenticate to access this feature',
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      if (authenticated) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Authentication failed')));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Figerprint'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authWithFingerprint();
              },
              child: const Text('Authenticate with Fingerprint'),
            ),
          ],
        ),
      ),
    );
  }
}
