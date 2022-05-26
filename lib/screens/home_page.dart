import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierProviderPage extends StatelessWidget {
  const ChangeNotifierProviderPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Selector<Model, int>(
              selector: (context, value) => value.counterPlusGetter,
              builder: (context, value, child) {
                debugPrint('counterPlus');
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Selector<Model, String>(
              selector: (context, value) => value.getChangedName,
              builder: (context, value, child) {
                debugPrint('counterMinus');
                return Text(
                  value,
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Consumer<Model>(
              builder: (context, value, child) => FloatingActionButton(
                onPressed: value.incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            Consumer<Model>(
              builder: (context, value, child) => FloatingActionButton(
                onPressed: value.changeMyName,
                tooltip: 'Change',
                child: const Icon(Icons.change_circle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Model with ChangeNotifier {
  int counterPlus = 0;
  String myName = 'Ehab';

  get counterPlusGetter => counterPlus;

  get getChangedName => myName;

  void incrementCounter() {
    counterPlus++;
    notifyListeners();
  }

  void changeMyName() {
    myName = 'Ahmed';
    notifyListeners();
  }

// get getCounter => counter;
}
