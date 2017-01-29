define('frontend/tests/unit/helpers/calculate-change-test', ['exports', 'frontend/helpers/calculate-change', 'qunit'], function (exports, _frontendHelpersCalculateChange, _qunit) {

  (0, _qunit.module)('Unit | Helper | calculate change');

  // Replace this with your real tests.
  (0, _qunit.test)('it works', function (assert) {
    var result = (0, _frontendHelpersCalculateChange.calculateChange)([42]);
    assert.ok(result);
  });
});