import React from 'react';
import ReactDom from 'react-dom';
import TaskApp from "./TaskApp";
import 'bootstrap/dist/css/bootstrap.css';

$(function() {
  ReactDom.render(
    <TaskApp url="/tasks" pollInterval={2000} />,
    document.getElementById('container')
  );
});
