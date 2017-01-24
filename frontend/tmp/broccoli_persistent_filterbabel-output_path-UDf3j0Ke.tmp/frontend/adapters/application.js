define('frontend/adapters/application', ['exports', 'ember-data', 'frontend/config/environment', 'frontend/adapters/custom-adapter'], function (exports, _emberData, _frontendConfigEnvironment, _frontendAdaptersCustomAdapter) {

  var adapter = _emberData['default'].RESTAdapter.extend({
    host: 'http://localhost:3000',
    namespace: 'api'
  });

  if (_frontendConfigEnvironment['default'].environment === 'production') {
    adapter = _frontendAdaptersCustomAdapter['default'];
  }

  exports['default'] = adapter;
});