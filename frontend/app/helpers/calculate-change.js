import Ember from 'ember';

export function calculateChange(params/*, hash*/) {
  let [prev, curr] = params
  let diff = curr - prev;
  diff = parseFloat(Math.round(diff * 100) / 100).toFixed(2);
  let symbol = (diff >= 0) ? "+" : "";

  return `${symbol}${diff}`;
}

export default Ember.Helper.helper(calculateChange);
