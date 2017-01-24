import Ember from 'ember';
import DS from 'ember-data';

let adapter = DS.RESTAdapter.extend({
  host: 'https://stocksentimentanalyzer.herokuapp.com',
  namespace: 'api'
});

export default adapter;
