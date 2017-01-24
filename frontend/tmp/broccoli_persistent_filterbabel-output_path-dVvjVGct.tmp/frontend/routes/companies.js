define('frontend/routes/companies', ['exports', 'ember'], function (exports, _ember) {
  exports['default'] = _ember['default'].Route.extend({
    model: function model() {
      return this.get('store').findAll('company');
    },
    actions: {
      'delete': function _delete(company) {
        company.deleteRecord();
        company.save();
      }
    }
  });
});