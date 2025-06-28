import 'package:flutter/material.dart';
import './backend.dart';
import './bmi_page.dart';

class ResultPage extends StatelessWidget {
  final CalculateResult calcResult;
  const ResultPage({super.key, required this.calcResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Center(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Your Result",
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 20),
              Container(
                height: 300,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(calcResult.status,
                        style: TextStyle(
                            color: calcResult.statusColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold)),
                    Text(calcResult.bmi.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.displayLarge),
                    Text(
                      calcResult.captions,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(EdgeInsets.zero),
                            minimumSize: WidgetStatePropertyAll(Size(310, 70)),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.yellow),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide.none))),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BmiPage(title: "BIM"))),
                        child: Text(
                          "RE-CALUCLATE BMI",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
