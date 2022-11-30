import 'package:redux/redux.dart';

import 'up_down_action.dart';
import 'up_down_state.dart';

UpDownState showUpButtonReducer(
  UpDownState state,
  ShowUpButtonAction action,
) {
  return state.copyWith(showUpButton: action.showUpButton);
}

UpDownState showDownButtonReducer(
  UpDownState state,
  ShowDownButtonAction action,
) {
  return state.copyWith(showDownButton: action.showDownButton);
}

Reducer<UpDownState> upDownReducer = combineReducers<UpDownState>([
  TypedReducer<UpDownState, ShowUpButtonAction>(
    showUpButtonReducer,
  ),
  TypedReducer<UpDownState, ShowDownButtonAction>(
    showDownButtonReducer,
  ),
]);
