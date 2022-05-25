import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWithContext extends StatelessWidget {
  const ProviderWithContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderOfContextModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider'),
        ),
        body: const ProviderItem(),
      ),
    );
  }
}

class ProviderItem extends StatelessWidget {
  const ProviderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderOfContextModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(provider.text),
        RaisedButton(
          child: const Text('Test Provider of context'),
          onPressed: () {
            provider.changeText();
          },
        ),
      ],
    );
  }
}

class ProviderOfContextModel with ChangeNotifier {
  String text = 'Provider of context';

  void changeText() {
    text = 'Changed text';
    notifyListeners();
  }
}
