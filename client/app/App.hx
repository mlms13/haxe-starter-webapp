package app;

import js.Browser;
import mithril.M;
import app.components.*;
import app.models.*;

class App {
  var routes : Dynamic;

  public function new() {
    var list = TodoListModel.fetch();
    var data = new TodoModel('Make this test app');
    var todo = new TodoView(data);

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
