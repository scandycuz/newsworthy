QUnit.module('JSHint | routes/company.js');
QUnit.test('should pass jshint', function(assert) {
  assert.expect(1);
  assert.ok(false, 'routes/company.js should pass jshint.\nroutes/company.js: line 1, col 8, \'Ember\' is defined but never used.\n\n1 error');
});
