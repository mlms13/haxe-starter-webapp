import abe.App;
import mw.ConnectLivereload;

class Main {
  public static function main() {
    var app = new App();
    app.router.use(ConnectLivereload.create());
    app.router.serve('/', './public');
    app.http(3333);
  }
}
