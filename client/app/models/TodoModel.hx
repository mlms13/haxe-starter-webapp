package app.models;

import mithril.M;

class TodoModel {
  public var title : String;
  public var isComplete : Bool;

  public function new(title) {
    this.title = title;
    this.isComplete = false;
  }
}
