import test from 'ava'
import React from 'react'
import {shallow} from 'enzyme'
import TaskForm from '../app/assets/javascripts/TaskForm'

test('has a TaskForm class name', t => {
  const wrapper = shallow(<TaskForm />);
  t.true(wrapper.hasClass('todoForm'));
});
