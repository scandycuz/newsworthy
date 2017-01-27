define('frontend/tests/unit/helpers/is-positive-test', ['exports', 'frontend/helpers/is-positive', 'qunit'], function (exports, _frontendHelpersIsPositive, _qunit) {

  (0, _qunit.module)('Unit | Helper | is positive');

  // Replace this with your real tests.
  (0, _qunit.test)('it works', function (assert) {
    var result = (0, _frontendHelpersIsPositive.isPositive)([42]);
    assert.ok(result);
  });
});