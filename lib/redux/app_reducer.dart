import 'app_state.dart';
import 'item_list/item_list_reducer.dart';
import 'search_term/search_term_reducer.dart';
import 'up_down/up_down_reducer.dart';

AppState reducer(AppState state, dynamic action) {
  return AppState(
    itemListState: itemsReducer(state.itemListState, action),
    searchTermState: searchTermReducer(state.searchTermState, action),
    upDownState: upDownReducer(state.upDownState, action),
  );
}
