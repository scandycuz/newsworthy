define('frontend/tests/routes/article.jshint.lint-test', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | routes/article.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(false, 'routes/article.js should pass jshint.\nroutes/article.js: line 4, col 21, \'params\' is defined but never used.\n\n1 error');
  });
});