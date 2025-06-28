import 'package:apps_collection/auth/login_screen.dart';
import 'package:apps_collection/bmi/bmi_page.dart';
import 'package:apps_collection/ecommers/screens/products_screen.dart';
import 'package:apps_collection/news/screens/news_page.dart';
import 'package:apps_collection/random_users/presentation/screens/random_user_screen.dart';
import 'package:apps_collection/tic_tac_toe/game_page.dart';
import 'package:apps_collection/to_do/screens/my_home_page.dart';
import 'package:flutter/material.dart';

class AppEntry {
  final String name;
  final IconData icon;
  final Widget screen;
  const AppEntry({
    required this.name,
    required this.icon,
    required this.screen,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<AppEntry> apps = [
    AppEntry(
      name: 'BMI Calculator',
      icon: Icons.fitness_center,
      screen: BmiPage(title: 'BMI Calculator'),
    ),
    AppEntry(
      name: 'E-Commerce',
      icon: Icons.shopping_cart,
      screen: ProductsScreen(),
    ),
    AppEntry(
      name: 'News',
      icon: Icons.article,
      screen: NewsPage(category: 'general'),
    ),
    AppEntry(
      name: 'Random Users',
      icon: Icons.people,
      screen: RandomUserScreenWidget(),
    ),
    AppEntry(name: 'Tic Tac Toe', icon: Icons.grid_3x3, screen: GamePage()),
    AppEntry(name: 'To-Do', icon: Icons.check_box, screen: MyHomePage()),
    AppEntry(name: 'Weather', icon: Icons.cloud, screen: HomePage()),
    AppEntry(name: 'Auth', icon: Icons.login, screen: LoginScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Apps Collection')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemCount: apps.length,
          itemBuilder: (context, index) {
            final app = apps[index];
            return GestureDetector(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => app.screen),
                  ),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      app.icon,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      app.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
