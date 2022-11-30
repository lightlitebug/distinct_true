import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/app_state.dart';
import '../redux/item_list/item_list_action.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        print('NewItem rebuild');
        return TextField(
          controller: _controller,
          decoration: const InputDecoration(labelText: 'Add Item'),
          onSubmitted: (String? newItem) {
            if (newItem != null && newItem.trim().isNotEmpty) {
              vm.addItem(newItem);
              _controller.clear();
            }
          },
        );
      },
    );
  }
}

class _ViewModel extends Equatable {
  final void Function(String newItem) addItem;
  const _ViewModel({
    required this.addItem,
  });

  static fromStore(Store<AppState> store) {
    return _ViewModel(
      addItem: (String newItem) => store.dispatch(
        AddItemAction(item: newItem),
      ),
    );
  }

  @override
  List<Object> get props => [];
}
