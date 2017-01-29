import BaseRoute from './base';

export default BaseRoute.extend({
  model() {
    return this.get('store').findAll('company');
  },
  actions: {
    willTransition: function($) {
      $(window).off('scroll', this._windowScroll);
    }
  }
});
