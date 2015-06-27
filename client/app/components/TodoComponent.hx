package app.components;

import mithril.M;

class TodoComponent implements Component {

  public function new() {

  }

  public function controller() {

  }

  public function view() : ViewOutput {
    return m('.todo-item', 'Todo Item');
  }
}
