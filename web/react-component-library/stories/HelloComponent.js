import React from 'react';
import { storiesOf } from '@storybook/react';
import HelloComponent from './../src/HelloComponent';


storiesOf('HelloComponent', module)
.add('HelloComponent', () => (
  <HelloComponent/>
));
