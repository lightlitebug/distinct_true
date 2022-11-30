import 'package:equatable/equatable.dart';

class SearchTermState extends Equatable {
  final String searchTerm;
  const SearchTermState({
    required this.searchTerm,
  });

  factory SearchTermState.initial() {
    return const SearchTermState(searchTerm: '');
  }

  @override
  String toString() => 'SearchTermState(searchTerm: $searchTerm)';

  SearchTermState copyWith({
    String? searchTerm,
  }) {
    return SearchTermState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  List<Object> get props => [searchTerm];
}
