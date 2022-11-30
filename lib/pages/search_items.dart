import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/app_state.dart';
import '../redux/search_term/search_term_action.dart';

class SearchItems extends StatelessWidget {
  const SearchItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return TextField(
          decoration: const InputDecoration(
            labelText: 'Search items...',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              vm.searchItem(newSearchTerm);
            }
          },
        );
      },
    );
  }
}

class _ViewModel extends Equatable {
  final void Function(String searchTerm) searchItem;
  const _ViewModel({
    required this.searchItem,
  });

  static fromStore(Store<AppState> store) {
    return _ViewModel(
      searchItem: (String searchTerm) => store.dispatch(
        SearchItemsAction(searchTerm: searchTerm),
      ),
    );
  }

  @override
  List<Object> get props => [];
}
