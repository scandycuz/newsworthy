define('frontend/tests/sticky-header/component.jshint.lint-test', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | sticky-header/component.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(false, 'sticky-header/component.js should pass jshint.\nsticky-header/component.js: line 2, col 17, \'computed\' is defined but never used.\n\n1 error');
  });
});