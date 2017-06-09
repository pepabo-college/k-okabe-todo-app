import React from 'react';
import ReactDom from 'react-dom';
import TaskApp from "./TaskApp"

$(function() {
  ReactDom.render(
    <TaskApp />,
    document.getElementById('container')
  );
});
