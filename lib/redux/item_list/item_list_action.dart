class AddItemAction {
  final String item;
  AddItemAction({
    required this.item,
  });

  @override
  String toString() => 'AddItemAction(item: $item)';
}

class DeleteItemAction {
  final String item;
  DeleteItemAction({
    required this.item,
  });

  @override
  String toString() => 'DeleteItemAction(item: $item)';
}
