import 'app_state.dart';
import 'item_list/item_list_reducer.dart';
import 'search_term/search_term_reducer.dart';

AppState reducer(AppState state, dynamic action) {
  // if (action is AddItemAction) {
  //   final itemListState = state.itemListState;
  //   final newItem = action.item;
  //   final newItems = [...itemListState.items, newItem];
  //   final newItemListState = itemListState.copyWith(items: newItems);

  //   return AppState(
  //     itemListState: newItemListState,
  //     searchTermState: state.searchTermState,
  //   );
  // } else if (action is DeleteItemAction) {
  //   final itemListState = state.itemListState;
  //   final newItems =
  //       itemListState.items.where((item) => item != action.item).toList();
  //   final newItemListState = itemListState.copyWith(items: newItems);

  //   return AppState(
  //     itemListState: newItemListState,
  //     searchTermState: state.searchTermState,
  //   );
  // } else if (action is SearchItemsAction) {
  //   final searchTermState = state.searchTermState;
  //   final newSearchTermState =
  //       searchTermState.copyWith(searchTerm: action.searchTerm);

  //   return AppState(
  //     itemListState: state.itemListState,
  //     searchTermState: newSearchTermState,
  //   );
  // }

  // return state;
  return AppState(
    itemListState: itemsReducer(state.itemListState, action),
    searchTermState: searchTermReducer(state.searchTermState, action),
  );
}
