import 'package:flutter/material.dart';
import 'package:sum_app/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    // Dispose additional controllers as needed

    super.dispose();
  }

  double sum = 0;
  Map<String, double> formValue = {"num1": 0, "num2": 0, "num3": 0};

  inputFormChange(inputKey, inputValue) {
    setState(() {
      formValue.update(inputKey, (value) => double.parse(inputValue));
    });
  }

  @override
  Widget build(BuildContext context) {
    addNumbers() {
      setState(() {
        sum = formValue["num1"]! + formValue["num2"]! + formValue["num3"]!;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sum App",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Sum is: ${sum.toInt()}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _controller1,
                onChanged: (value) {
                  inputFormChange("num1", value);
                },
                keyboardType: TextInputType.number,
                decoration: formInputDecoration(
                  "Number 1",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _controller2,
                onChanged: (value) {
                  inputFormChange("num2", value);
                },
                keyboardType: TextInputType.number,
                decoration: formInputDecoration(
                  "Number 2",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _controller3,
                onChanged: (value) {
                  inputFormChange("num3", value);
                },
                keyboardType: TextInputType.number,
                decoration: formInputDecoration(
                  "Number 3",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      addNumbers();
                      setState(() {
                        _controller1.clear();
                        _controller2.clear();
                        _controller3.clear();
                      });
                    },
                    child: const Text("Sum"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
