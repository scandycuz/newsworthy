define('frontend/tests/mixins/reset-scroll-position.jshint.lint-test', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | mixins/reset-scroll-position.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(true, 'mixins/reset-scroll-position.js should pass jshint.');
  });
});