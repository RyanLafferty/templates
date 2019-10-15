import React from 'react';
import ShallowRenderer from 'react-test-renderer/shallow';
import HelloComponent from 'HelloComponent';

describe('HelloComponent', () => {
  let props;
  const renderer = new ShallowRenderer();

  beforeEach(() => {
    props = {};
  });

  describe('when no props are provided', () => {
    it('HelloComponent renders', () => {
      expect(
        renderer.render(<HelloComponent {...props} />),
      ).toMatchSnapshot();
    });
  });
});
