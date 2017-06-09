import React from "react";

export default class Task extends React.Component {
  // Todo削除
  handleDelete(e){
    e.preventDefault();
    this.props.onTaskDelete({id: this.props.id});
  }
  render() {
    return (
      <tr key={this.props.id}>
        <td>
          {this.props.content}
        </td>
        <td>
          {this.props.status}
        </td>
        <td>
            <button onClick={this.handleDelete.bind(this)}>削除</button>
        </td>
      </tr>
    );
  }
}
