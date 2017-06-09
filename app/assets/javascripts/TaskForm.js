import React from "react";
import ReactDom from "react-dom";

export default class TaskForm extends React.Component {
  handleSubmit(e) {
    e.preventDefault();
    var content = ReactDom.findDOMNode(this.refs.content).value.trim();
    if (!content) {
      return;
    }
    this.props.onTaskSubmit({content: content, status: 'todo'});
    ReactDom.findDOMNode(this.refs.content).value = '';
    return;
  }

  render() {
    return (
      <form className="todoForm" onSubmit={this.handleSubmit.bind(this)}>
        <input type="text" placeholder="ToDo" ref="content" />
        <input type="submit" value="登録" />
      </form>
    );
  }
}
