import React from "react";
import ReactDOM from "react-dom";

export default class Task extends React.Component {
  constructor(){
    super();
    this.state = ({isEditable:false});
  }
  // Todo削除
  handleDelete(e){
    e.preventDefault();
    this.props.onTaskDelete({id: this.props.id});
  }
  // Todo更新
  handleUpdate(e) {
    e.preventDefault();
    this.props.onTaskUpdate({task: {id: this.props.id, status: e.target.value}});
  }

  handleDoubleClick(e) {
    e.preventDefault();
    this.setState({isEditable:true});
  }

  handleTaskContentUpdate(e) {
    e.preventDefault();
    this.props.onTaskUpdate({task: {id: this.props.id, content: e.target.value}});
    this.state = ({isEditable:false});
  }

  handleTaskContentSubmit(e){
    e.preventDefault();
    if (e.target.editingForm.value=='') {
      this.state = ({isEditable:false});
    } else {
      this.props.onTaskUpdate({task: {id: this.props.id, content: e.target.editingForm.value}});
      this.state = ({isEditable:false});
    }
  }

  componentDidUpdate() {
    let editing = ReactDOM.findDOMNode(this.refs.editing);
    editing && editing.focus();
  }

  render() {
    return (
      <tr key={this.props.id}>
        {(() => {
          return this.state.isEditable ?
          <td>
            <form onSubmit={this.handleTaskContentSubmit.bind(this)}>
              <input type="text"
                name="editingForm"
                defaultValue={this.props.content}
                onBlur={this.handleTaskContentUpdate.bind(this)}
                ref="editing" >
              </input>
            </form>
          </td> :
          <td onDoubleClick = {this.handleDoubleClick.bind(this)} >
            {this.props.content}
          </td>;
        })()}
        <td>
          <select defaultValue={this.props.status} onChange={this.handleUpdate.bind(this)}>
            <option value="todo" key="todo">todo</option>
            <option value="doing" key="doing">doing</option>
            <option value="done" key="done">done</option>
          </select>
        </td>
        <td>
            <button onClick={this.handleDelete.bind(this)}>削除</button>
        </td>
      </tr>
    );
  }
}
