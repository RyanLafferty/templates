import React from 'react';
import { storiesOf } from '@storybook/react';
import HelloComponent from './../src/HelloComponent';


storiesOf('HelloWorld/HelloComponent', module)
.add('HelloComponent', () => (
  <HelloComponent/>
));
