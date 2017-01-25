define('frontend/tests/models/company.jshint.lint-test', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | models/company.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(false, 'models/company.js should pass jshint.\nmodels/company.js: line 30, col 6, Missing semicolon.\nmodels/company.js: line 19, col 12, \'Ember\' is not defined.\n\n2 errors');
  });
});