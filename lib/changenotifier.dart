import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Change extends ConsumerWidget {
  const Change({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final profider = watch(incrementProvider); //ini buat watch datanya
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod flutter demo'),
      ),
      body: Center(
        child: Text(profider.value.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read(incrementProvider)
              .increment(); //ini buat increment atau memanggil fungsi nya
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Increment extends ChangeNotifier {
  int _value = 0;
  get value => _value;

  void increment() {
    _value += 1;
    notifyListeners();
  }
}

final incrementProvider = ChangeNotifierProvider((_) => Increment());
