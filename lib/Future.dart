import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Futuree extends ConsumerWidget {
  const Futuree({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final cuaca = watch(getTitik);
    return Scaffold(
        appBar: AppBar(
          title: Text('Riverpod flutter demo'),
        ),
        body: Center(
            child: cuaca.when(
                data: (data) => Text(data.toString()),
                loading: () => CircularProgressIndicator(),
                error: (e, s) => Text('$e'))));
  }
}

Future<int> getTitikBanjir() async {
  await Future.delayed(Duration(seconds: 10));
  return 20;
}

final getTitik = FutureProvider<int>((_) => getTitikBanjir());
