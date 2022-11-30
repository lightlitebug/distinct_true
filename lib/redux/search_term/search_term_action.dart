class SearchItemsAction {
  final String searchTerm;
  SearchItemsAction({
    required this.searchTerm,
  });

  @override
  String toString() => 'SearchItemsAction(searchTerm: $searchTerm)';
}
