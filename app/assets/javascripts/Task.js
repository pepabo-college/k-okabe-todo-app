import React from "react";

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
  // Todo削除
  handleUpdate(e) {
    e.preventDefault();
    this.props.onTaskUpdate({task: {id: this.props.id, status: e.target.value}});
  }

  //stateによってどっちを出すか分岐させる
  handleDoubleClick(e) {
    e.preventDefault();
    this.setState({isEditable:true});
  }
  //コンテンツを表示するメソッド
  //更新用のFormが出るメソッド

  render() {
    return (
      <tr key={this.props.id}>
        {(() => {
          return this.state.isEditable ?
          <td>
            <input type="text" defaultValue={this.props.content} onBlur={this.handleUpdate.bind(this)}>
            </input>
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
