import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.get('store').findAll('company');
  },
  actions: {
    willTransition: function(transition) {
      $(window).off('scroll', this._windowScroll);
    }
  }
});
