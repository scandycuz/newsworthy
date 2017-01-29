define('frontend/routes/companies', ['exports', 'frontend/routes/base'], function (exports, _frontendRoutesBase) {
  exports['default'] = _frontendRoutesBase['default'].extend({
    model: function model() {
      return this.get('store').findAll('company');
    },
    actions: {
      willTransition: function willTransition($) {
        $(window).off('scroll', this._windowScroll);
      }
    }
  });
});