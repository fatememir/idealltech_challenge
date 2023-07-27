import 'package:flutter/material.dart';
import 'package:idealltech_challenge/my_service.dart';
import 'error_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ideal Tech'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  firstQuestion();
                },
                child: const Text("1.1")),
            ElevatedButton(
                onPressed: () {
                  secondQuestion();
                },
                child: const Text("1.2")),
            ElevatedButton(
                onPressed: () {
                  thirdQuestion();
                },
                child: const Text("1.3")),
            ElevatedButton(
                onPressed: () {
                  fourthQuestion();
                },
                child: const Text("1.4"))
          ],
        ),
      ),
    );
  }

  firstQuestion() {
    List<int> numbers = [1, 2, 3, 4, 5];

    List<int> firstNewArrayNumbers = newArrayDeclarative(numbers);
    print(firstNewArrayNumbers);

    List<int> secondNewArrayNumbers = newArrayImperative(numbers);
    print(secondNewArrayNumbers);
  }

  List<int> newArrayImperative(List<int> numbers) {
    List<int> newArrayNumbers = [];
    for (int num in numbers) {
      newArrayNumbers.add(num + num);
    }
    return newArrayNumbers;
  }

  List<int> newArrayDeclarative(List<int> numbers) {
    return numbers.map((num) => num + num).toList();
  }

  ////////////////////////////////////
  secondQuestion() {
    List<int> numbers = [1, 2, 3, 4, 5];
    newArrayNumbers(numbers).then((result) {
      print("Numbers: $result");
    });
  }

  Future<List<int>> newArrayNumbers(List<int> inputArray) async {
    List<int> result = [];
    for (int item in inputArray) {
      int transformedItem = await simulateAsyncProcessing(item);
      result.add(transformedItem);
    }
    return result;
  }

  Future<int> simulateAsyncProcessing(int number) async {
    await Future.delayed(const Duration(seconds: 1));
    return number + number;
  }

////////////////////////////////////
  thirdQuestion() {
    var nestedList = [
      4,
      [
        [5],
        [
          6,
          [7],
          8
        ],
        9,
        10
      ]
    ];
    var editedList = finalList(nestedList);
    print(editedList);
  }

  List<dynamic> finalList(List<dynamic> nestedList) {
    List<dynamic> editedList = [];
    for (var i = 0; i < nestedList.length; i++) {
      var item = nestedList[i];
      if (item is List) {
        editedList.addAll(finalList(item));
      } else {
        editedList.add(item);
      }
    }
    return editedList;
  }

////////////////////////////////////
  fourthQuestion() {
    var service = MyService();
    var proxy = ErrorHandler(service);
    print(service.fetchData()); // prints 'data'
    print(proxy.fetchData()); // prints '404'
  }
}
