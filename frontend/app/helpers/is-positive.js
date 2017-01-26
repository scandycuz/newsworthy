import Ember from 'ember';

export function isPositive(params) {
  let [prev, curr] = params;
  let diff = curr - prev;

  return diff > 0;
}

export default Ember.Helper.helper(isPositive);
