import 'package:flutter/material.dart';
import '../providers/weather_provider.dart';
import 'package:provider/provider.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather APP")),
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Consumer<WeatherProvider>(
          builder: (context, value, child) {
            var result = value.responseResult;

            if (value.error != null) {
              String errorMessage = value.error!;
              value.error = null;
              return Text(errorMessage);
            } else if (result == null) {
              value.getWeather();
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            value.responseResult = null;
            return Container(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        result.location,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        result.temp,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        result.condition,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Image(image: NetworkImage(result.conditionIcon))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
