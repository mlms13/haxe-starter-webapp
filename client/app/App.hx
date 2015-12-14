package app;

import js.Browser;
import lies.Store;

class App {
  public static function main() {
    var initialState = State.NoData;
    var store : Store<State, Action> = Store.create(Reducer.app, initialState);
  }
}
