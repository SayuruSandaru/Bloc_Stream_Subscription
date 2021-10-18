import 'package:bloctest/bloc/counter_bloc.dart';
import 'package:bloctest/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  final InternetBloc internetBloc = InternetBloc();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (BuildContext context) => CounterBloc(internetBloc)),
        BlocProvider<InternetBloc>(create: (BuildContext context) => InternetBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterAddition) {
                  return Text(
                    state.value.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state is CounterSubstraction) {
                  return Text(
                    state.value.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    'No value',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            TextButton(
              onPressed: () => context.read<CounterBloc>().add(CounterSubstractOne()),
              child: const Text('Decrement'),
            ),
            TextButton(
              onPressed: () => context.read<InternetBloc>().add(GetInternetState()),
              child: const Text('Check connetion'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterBloc>().add(CounterAddOne()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
