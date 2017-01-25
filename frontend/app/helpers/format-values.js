import Ember from 'ember';

export function formatValues(number) {
  number = parseFloat(Math.round(number * 100) / 100).toFixed(2);
  return number;
}

export default Ember.Helper.helper(formatValues);
