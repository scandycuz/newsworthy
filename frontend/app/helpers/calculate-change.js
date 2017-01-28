import Ember from 'ember';

export function calculateChange(params/*, hash*/) {
  let [prev, curr] = params;
  let diff = curr - prev;

  diff = Math.abs(parseFloat(Math.round(diff * 100) / 100)).toFixed(2);

  return `${diff}`;
}

export default Ember.Helper.helper(calculateChange);
