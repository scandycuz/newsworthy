define('frontend/tests/routes/companies.jshint.lint-test', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | routes/companies.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(false, 'routes/companies.js should pass jshint.\nroutes/companies.js: line 9, col 30, \'transition\' is defined but never used.\nroutes/companies.js: line 10, col 7, \'$\' is not defined.\nroutes/companies.js: line 1, col 8, \'Ember\' is defined but never used.\n\n3 errors');
  });
});