import 'package:flutter/material.dart';
import '../providers/weather_provider.dart';
import '../screens/weather_details_page.dart';
import '../widgets/field.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Search Weather")),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Field(
                label: "City Name",
                controller: prov.cityNameCtrl,
                icon: Icons.search,
                validatorFunc:
                    (String? txt) =>
                        prov.cityNameCtrl.text.isEmpty
                            ? "Please enter a city name"
                            : null,
              ),
              Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherDetailsPage(),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Get Weather"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
