define('frontend/tests/adapters/custom-adapter.jshint.lint-test', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | adapters/custom-adapter.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(true, 'adapters/custom-adapter.js should pass jshint.');
  });
});