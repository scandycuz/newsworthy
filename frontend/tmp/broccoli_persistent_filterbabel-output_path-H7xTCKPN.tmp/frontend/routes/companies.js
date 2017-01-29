define('frontend/routes/companies', ['exports', 'ember', 'frontend/routes/base'], function (exports, _ember, _frontendRoutesBase) {
  exports['default'] = _frontendRoutesBase['default'].extend({
    model: function model() {
      return this.get('store').findAll('company');
    },
    actions: {
      willTransition: function willTransition() {
        _ember['default'].$(window).off('scroll', this._windowScroll);
      }
    }
  });
});