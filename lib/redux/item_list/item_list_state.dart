import 'package:equatable/equatable.dart';

class ItemListState extends Equatable {
  final List<String> items;
  const ItemListState({
    required this.items,
  });

  factory ItemListState.initial() {
    return const ItemListState(items: []);
  }

  @override
  String toString() => 'ItemListState(items: $items)';

  ItemListState copyWith({
    List<String>? items,
  }) {
    return ItemListState(
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [items];
}
