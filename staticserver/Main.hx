import abe.App;

class Main {
  public static function main() {
    var app = new App();
    app.router.serve('/', './public');
    app.http(3333);
  }
}
