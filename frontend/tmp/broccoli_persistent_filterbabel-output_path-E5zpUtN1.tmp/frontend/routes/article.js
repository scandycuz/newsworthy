define('frontend/routes/article', ['exports', 'ember'], function (exports, _ember) {
  exports['default'] = _ember['default'].Route.extend({
    model: function model() {
      var company = this.modelFor('company');
      return this.store.query('article', { company_id: company.id });
    }
  });
});