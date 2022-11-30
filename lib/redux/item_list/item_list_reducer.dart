import 'package:redux/redux.dart';

import 'item_list_action.dart';
import 'item_list_state.dart';

Reducer<ItemListState> itemsReducer = combineReducers<ItemListState>([
  TypedReducer<ItemListState, AddItemAction>(addItemReducer),
  TypedReducer<ItemListState, DeleteItemAction>(deleteItemReducer),
]);

ItemListState addItemReducer(
  ItemListState state,
  AddItemAction action,
) {
  final newItem = action.item;
  final newItems = [...state.items, newItem];
  return state.copyWith(items: newItems);
}

ItemListState deleteItemReducer(
  ItemListState state,
  DeleteItemAction action,
) {
  final newItems = state.items.where((item) => item != action.item).toList();
  return state.copyWith(items: newItems);
}
