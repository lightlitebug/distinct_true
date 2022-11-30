import 'package:equatable/equatable.dart';

import 'item_list/item_list_state.dart';
import 'search_term/search_term_state.dart';
import 'up_down/up_down_state.dart';

class AppState extends Equatable {
  final ItemListState itemListState;
  final SearchTermState searchTermState;
  final UpDownState upDownState;
  const AppState({
    required this.itemListState,
    required this.searchTermState,
    required this.upDownState,
  });

  factory AppState.initial() {
    return AppState(
      itemListState: ItemListState.initial(),
      searchTermState: SearchTermState.initial(),
      upDownState: UpDownState.initial(),
    );
  }

  @override
  String toString() =>
      'AppState(itemListState: $itemListState, searchTermState: $searchTermState, upDownState: $upDownState)';

  @override
  List<Object> get props => [itemListState, searchTermState, upDownState];

  AppState copyWith({
    ItemListState? itemListState,
    SearchTermState? searchTermState,
    UpDownState? upDownState,
  }) {
    return AppState(
      itemListState: itemListState ?? this.itemListState,
      searchTermState: searchTermState ?? this.searchTermState,
      upDownState: upDownState ?? this.upDownState,
    );
  }
}
