import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'pages/items_page.dart';
import 'redux/app_reducer.dart';
import 'redux/app_state.dart';

late final Store<AppState> store;

void main() {
  store = Store<AppState>(
    reducer,
    initialState: AppState.initial(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Combine Reducers',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ItemsPage(),
      ),
    );
  }
}
