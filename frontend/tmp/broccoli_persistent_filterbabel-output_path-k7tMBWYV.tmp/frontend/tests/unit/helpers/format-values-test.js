define('frontend/tests/unit/helpers/format-values-test', ['exports', 'frontend/helpers/format-values', 'qunit'], function (exports, _frontendHelpersFormatValues, _qunit) {

  (0, _qunit.module)('Unit | Helper | format values');

  // Replace this with your real tests.
  (0, _qunit.test)('it works', function (assert) {
    var result = (0, _frontendHelpersFormatValues.formatValues)([42]);
    assert.ok(result);
  });
});