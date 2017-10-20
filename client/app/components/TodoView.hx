package app.components;

import mithril.M;
import app.models.TodoModel;

class TodoView implements View {
  public var data : TodoModel;

  public function new(model : TodoModel) {
    this.data = model;
  }

  public function view() : ViewOutput {
    return m('.todo-item', data.title);
  }
}
