import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/app_state.dart';
import '../redux/up_down/up_down_action.dart';
import 'new_item.dart';
import 'search_items.dart';
import 'show_items.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  late final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StoreConnector<AppState, _ViewModel>(
        distinct: true,
        onInit: (Store<AppState> store) {
          scrollController = ScrollController();
          scrollController.addListener(() {
            if (scrollController.offset > 50) {
              // show ScrollToTop button
              store.dispatch(ShowUpButtonAction(showUpButton: true));
            } else {
              // Hide ScrollToTop button
              store.dispatch(ShowUpButtonAction(showUpButton: false));
            }

            if (scrollController.position.maxScrollExtent -
                    scrollController.offset >
                50) {
              // show ScrollToBottom button
              store.dispatch(ShowDownButtonAction(showDownButton: true));
            } else {
              // hide ScrollToBottom button
              store.dispatch(ShowDownButtonAction(showDownButton: false));
            }
          });
        },
        onDispose: (Store<AppState> store) {
          scrollController.dispose();
        },
        onDidChange: (_ViewModel? prev, _ViewModel current) {
          if (prev!.items.length < current.items.length) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
            );
          }
        },
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel vm) {
          print('ItemsPage rebuild');
          return Scaffold(
            body: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: const [
                    NewItem(),
                    SizedBox(height: 20.0),
                    SearchItems(),
                    SizedBox(height: 20.0),
                    ShowItems(),
                  ],
                ),
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedOpacity(
                  opacity: vm.showUpButton ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 250),
                  child: FloatingActionButton(
                    onPressed: () {
                      scrollController.animateTo(
                        scrollController.position.minScrollExtent,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    backgroundColor: Colors.redAccent,
                    child: const Icon(Icons.arrow_upward),
                  ),
                ),
                const SizedBox(width: 10.0),
                AnimatedOpacity(
                  opacity: vm.showDownButton ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 250),
                  child: FloatingActionButton(
                    onPressed: () {
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    backgroundColor: Colors.redAccent,
                    child: const Icon(Icons.arrow_downward),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ViewModel extends Equatable {
  final List<String> items;
  final bool showUpButton;
  final bool showDownButton;
  const _ViewModel({
    required this.items,
    required this.showUpButton,
    required this.showDownButton,
  });

  static fromStore(Store<AppState> store) {
    return _ViewModel(
      items: store.state.itemListState.items,
      showUpButton: store.state.upDownState.showUpButton,
      showDownButton: store.state.upDownState.showDownButton,
    );
  }

  @override
  List<Object> get props => [items, showUpButton, showDownButton];
}
