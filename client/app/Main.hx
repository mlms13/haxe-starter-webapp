package app;

import mithril.M;

class Main {
  var routes : Dynamic<MithrilModule<Dynamic>>;

  public function new() {
    var overviewModule = new OverviewModule();

    routes = {
      "/overview": overviewModule
    };
  }

  public static function main() {
    new Main();
  }
}
