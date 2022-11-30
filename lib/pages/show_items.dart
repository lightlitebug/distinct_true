import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/app_state.dart';
import '../redux/item_list/item_list_action.dart';

class ShowItems extends StatelessWidget {
  const ShowItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: vm.items.length,
          separatorBuilder: (BuildContext conext, int index) {
            return const Divider(color: Colors.grey);
          },
          itemBuilder: (BuildContext context, int index) {
            final item = vm.items[index];
            return ListTile(
              title: Text(
                item,
                style: const TextStyle(fontSize: 18.0),
              ),
              trailing: IconButton(
                onPressed: () {
                  vm.deleteItem(item);
                },
                icon: const Icon(Icons.delete),
              ),
            );
          },
        );
      },
    );
  }
}

class _ViewModel extends Equatable {
  final List<String> items;
  final void Function(String item) deleteItem;
  const _ViewModel({
    required this.items,
    required this.deleteItem,
  });

  static List<String> _getFilteredItems({
    required List<String> items,
    required String searchTerm,
  }) {
    List<String> filteredItems = items;

    if (searchTerm.isNotEmpty) {
      filteredItems = filteredItems.where((item) {
        if (item.toLowerCase().contains(searchTerm.toLowerCase())) {
          return true;
        }
        return false;
      }).toList();
    }

    return filteredItems;
  }

  static fromStore(Store<AppState> store) {
    return _ViewModel(
      items: _getFilteredItems(
        items: store.state.itemListState.items,
        searchTerm: store.state.searchTermState.searchTerm,
      ),
      deleteItem: (String item) => store.dispatch(
        DeleteItemAction(item: item),
      ),
    );
  }

  @override
  List<Object> get props => [items];
}
