import 'package:equatable/equatable.dart';

class UpDownState extends Equatable {
  final bool showUpButton;
  final bool showDownButton;
  const UpDownState({
    required this.showUpButton,
    required this.showDownButton,
  });

  factory UpDownState.initial() {
    return const UpDownState(
      showUpButton: false,
      showDownButton: false,
    );
  }

  @override
  List<Object> get props => [showUpButton, showDownButton];

  @override
  String toString() =>
      'UpDownState(showUpButton: $showUpButton, showDownButton: $showDownButton)';

  UpDownState copyWith({
    bool? showUpButton,
    bool? showDownButton,
  }) {
    return UpDownState(
      showUpButton: showUpButton ?? this.showUpButton,
      showDownButton: showDownButton ?? this.showDownButton,
    );
  }
}
