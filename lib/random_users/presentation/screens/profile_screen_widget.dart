import 'package:flutter/material.dart';
import '../../models/user.dart';

class ProfileScreenWidget extends StatelessWidget {
  static const String routeName = "/detailsPage";
  const ProfileScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User?;
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: const Center(
          child: Text('No user data available'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                  radius: 50, backgroundImage: NetworkImage(user.picture)),
            ),
            const SizedBox(height: 16),
            Text('Name: ${user.name}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Email: ${user.email}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Gender: ${user.gender}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Phone: ${user.phone}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Cell: ${user.cell}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
