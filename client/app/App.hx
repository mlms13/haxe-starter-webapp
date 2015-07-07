package app;

import js.Browser;
import mithril.M;
import app.components.*;
import app.models.*;

class App {
  var routes : Dynamic;

  public function new() {
    var listView = new TodoListController();

    routes = {
      "/": listView
    };
  }

  public function start() {
    M.route(Browser.document.body, '/', routes);
  }

  public static function main() {
    new App().start();
  }
}
