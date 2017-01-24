define('frontend/adapters/custom-adapter', ['exports', 'ember', 'ember-data'], function (exports, _ember, _emberData) {

  var adapter = _emberData['default'].RESTAdapter.extend({
    host: 'https://stocksentimentanalyzer.herokuapp.com',
    namespace: 'api'
  });

  exports['default'] = adapter;
});