import test from 'ava'
import React from 'react'
import {shallow} from 'enzyme'
import TaskApp from '../app/assets/javascripts/TaskApp'

test('has a TaskApp class name', t => {
  const wrapper = shallow(<TaskApp />);
  t.true(wrapper.hasClass('taskApp'));
});
