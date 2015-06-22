package app;

import mithril.M;

class App {
  var routes : Dynamic<MithrilModule<Dynamic>>;

  public function new() {
    var overviewModule = new OverviewModule();

    routes = {
      "/overview": overviewModule
    };
  }
  
  public function start() {
    M.route(js.Browser.document, '/', routes);
  }

  public static function main() {
    new App().start();
  }
}
