define('frontend/helpers/format-values', ['exports', 'ember'], function (exports, _ember) {
  exports.formatValues = formatValues;

  function formatValues(number) {
    number = parseFloat(Math.round(number * 100) / 100).toFixed(2);
    return number;
  }

  exports['default'] = _ember['default'].Helper.helper(formatValues);
});