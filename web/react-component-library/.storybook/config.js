import { configure } from '@storybook/react';

function loadStories() {
  require('../stories/HelloComponent.js');
}

configure(loadStories, module);