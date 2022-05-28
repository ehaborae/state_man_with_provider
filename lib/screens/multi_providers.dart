import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviders extends StatelessWidget {
  const MultiProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MultiProvider(
              providers: [
                Provider(
                  create: (context) => ProviderModel(),
                ),
                ChangeNotifierProvider(
                  create: (context) => ChangeNotifierModel(),
                ),
              ],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ChangeNotifierModel>(
                    builder: (context, value, child) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('name: ${value.name}'),
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            value.changeName();
                            print(value.name);
                          },
                          focusElevation: 0,
                          elevation: 0,
                          child: const Text('Go to Provider'),
                        ),
                        MaterialButton(
                          color: Colors.red,
                          onPressed: () {
                            value.changeNameAgain();
                            print(value.name);
                          },
                          focusElevation: 0,
                          elevation: 0,
                          child: const Text('Go to Provider'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProviderModel {
  String name = 'Provider';

  void changeName() {
    name = 'Provider2';
  }

  void changeNameAgain() {
    name = 'Provider3';
  }
}

class ChangeNotifierModel extends ChangeNotifier {
  String name = 'Provider';

  void changeName() {
    name = 'Provider2';
    notifyListeners();
  }

  void changeNameAgain() {
    name = 'Provider3';
    notifyListeners();
  }
}
