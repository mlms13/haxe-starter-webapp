package app.components;

import mithril.M;

class TodoView implements View {

  public function new() {

  }

  public function view() : ViewOutput {
    return m('.todo-item', 'Todo Item');
  }
}
