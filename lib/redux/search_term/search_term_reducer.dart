import 'package:redux/redux.dart';

import 'search_term_action.dart';
import 'search_term_state.dart';

Reducer<SearchTermState> searchTermReducer = combineReducers([
  TypedReducer<SearchTermState, SearchItemsAction>(searchItemsReducer),
]);

SearchTermState searchItemsReducer(
  SearchTermState state,
  SearchItemsAction action,
) {
  return state.copyWith(searchTerm: action.searchTerm);
}
