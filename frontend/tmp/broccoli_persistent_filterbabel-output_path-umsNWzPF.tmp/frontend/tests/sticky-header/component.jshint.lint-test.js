define('frontend/tests/sticky-header/component.jshint.lint-test', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | sticky-header/component.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(true, 'sticky-header/component.js should pass jshint.');
  });
});