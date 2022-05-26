import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

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
            Provider(
              create: (context) => ProviderModel(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ProviderModel>(
                    builder: (context, value, child) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('name: ${value.name}'),
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            value.changeName();
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
    name = 'Provider Changed';
  }

  void changeNameAgain() {
    name = 'Provider Changed Again';
    print(name);
  }
}
