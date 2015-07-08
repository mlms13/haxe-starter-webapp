package app;

import js.Browser;
import mithril.M;
import app.components.*;
import app.models.*;

class App {
  var routes : Dynamic;

  public function new() {
    var listView = new TodoListComponent();

    routes = {
      "/": listView
    };
  }

  public function start() {
    M.route(Browser.document.querySelector('#app'), '/', routes);
  }

  public static function main() {
    new App().start();
  }
}
