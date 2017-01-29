define('frontend/adapters/custom-adapter', ['exports', 'ember-data'], function (exports, _emberData) {

  var adapter = _emberData['default'].RESTAdapter.extend({
    host: 'https://stocksentimentanalyzer.herokuapp.com',
    namespace: 'api'
  });

  exports['default'] = adapter;
});