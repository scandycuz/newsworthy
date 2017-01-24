define('frontend/routes/company', ['exports', 'ember'], function (exports, _ember) {
  exports['default'] = _ember['default'].Route.extend({
    model: function model(params) {
      return this.store.queryRecord('company', { slug: params.company_slug });
    }
  });
});