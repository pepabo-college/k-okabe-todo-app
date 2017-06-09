import React from "react";
import TaskForm from "./TaskForm"
import TaskList from "./TaskList"

export default class TaskApp extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      data: [
          {
            id: 1,
            content: "ダミーデータ",
            status: "todo",
            url: "/tasks/1.json"
          }
      ]
    };
  }

  handleTaskSubmit(task) {
    var tasks = this.state.data;
    var newTasks = tasks.concat([task]);
    this.setState({data: newTasks});
  }

  render() {
    return (
      <div className="TaskApp">
        <TaskForm
        onTaskSubmit={this.handleTaskSubmit.bind(this)} />
          <table>
            <thead>
            <tr>
              <th>Content</th>
              <th>Status</th>
              <th colSpan="3"></th>
            </tr>
            </thead>
            <TaskList
              data={this.state.data}
            />
          </table>
      </div>
      );
    }
}
