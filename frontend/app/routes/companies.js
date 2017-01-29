import Ember from 'ember';
import BaseRoute from './base';

export default BaseRoute.extend({
  model() {
    return this.get('store').findAll('company');
  },
  actions: {
    willTransition: function() {
      Ember.$(window).off('scroll', this._windowScroll);
    }
  }
});
