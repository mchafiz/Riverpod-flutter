import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/changenotifier.dart';
import 'Future.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final hel0 = Provider<String>((_) => 'kocak anda');
final berubah = StateProvider<int>((_) => 0);

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final nomor = watch(berubah);
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Flutter demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nomor.state.toString(),
              style: TextStyle(fontSize: 20),
            ),
            FlatButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Futuree())),
                child: Text('TO THE FUTURE')),
            FlatButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Change())),
              child: Text('ChangeNotifier'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(berubah).state++;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
