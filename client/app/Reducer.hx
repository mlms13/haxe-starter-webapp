package app;

import lies.Reduced;

class Reducer {
  public static function app(state : State, action : Action) : Reduced<State, Action> {
    return switch action {
      case ChangeView: changeView(state);
    }
  }

  static function changeView(state : State) {
    return Reduced.fromState(state);
  }
}
