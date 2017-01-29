define('frontend/mixins/reset-scroll-position', ['exports', 'ember'], function (exports, _ember) {
  exports['default'] = _ember['default'].Mixin.create({
    activate: function activate() {
      this._super();
      window.scrollTo(0, 0);
    }
  });
});