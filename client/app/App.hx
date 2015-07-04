package app;

import js.Browser;
import mithril.M;
import app.components.*;

class App {
  var routes : Dynamic;

  public function new() {
    var todo = new TodoView();

    routes = {
      "/": todo
    };
  }

  public function start() {
    M.route(Browser.document.body, '/', routes);
  }

  public static function main() {
    new App().start();
  }
}
