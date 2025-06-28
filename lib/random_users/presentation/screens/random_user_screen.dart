import '../providers/random_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../widgets/user_card_widget.dart';

class RandomUserScreenWidget extends StatefulWidget {
  const RandomUserScreenWidget({super.key});

  @override
  State<RandomUserScreenWidget> createState() => _RandomUserScreenWidgetState();
}

class _RandomUserScreenWidgetState extends State<RandomUserScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Users'), centerTitle: true),
      body: Center(
        child: Consumer<RandomUserProvider>(
          builder:
              (BuildContext context, RandomUserProvider prov, Widget? child) =>
                  FutureBuilder<List<User>>(
                    future: prov.getUsers(20),
                    builder: (context, snapshot) {
                      var usersList = snapshot.data;
                      return snapshot.hasError
                          ? Text(
                            snapshot.error.toString(),
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: Colors.red),
                          )
                          : usersList != null
                          ? ListView.builder(
                            itemBuilder:
                                (context, index) => UserCard(
                                  user: usersList[index],
                                  index: index,
                                ),
                            itemCount: usersList.length,
                          )
                          : const CircularProgressIndicator();
                    },
                  ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => ()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
