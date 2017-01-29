define('frontend/routes/company', ['exports', 'frontend/routes/base'], function (exports, _frontendRoutesBase) {
  exports['default'] = _frontendRoutesBase['default'].extend({

    model: function model(params) {
      return this.store.queryRecord('company', { slug: params.company_slug });
    }
  });
});