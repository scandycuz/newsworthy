define('frontend/tests/adapters/custom-adapter.jshint.lint-test', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | adapters/custom-adapter.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(false, 'adapters/custom-adapter.js should pass jshint.\nadapters/custom-adapter.js: line 1, col 8, \'Ember\' is defined but never used.\n\n1 error');
  });
});