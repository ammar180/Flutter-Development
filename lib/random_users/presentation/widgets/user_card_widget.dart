import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../screens/profile_screen_widget.dart';

class UserCard extends StatelessWidget {
  final User user;
  final int index;
  const UserCard({super.key, required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreenWidget(),
              settings: RouteSettings(arguments: user),
            ),
          ),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(user.picture)),
          title: Text(user.name),
          subtitle: Text(user.email),
          trailing: Text(user.phone),
        ),
      ),
    );
  }
}
