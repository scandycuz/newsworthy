define('frontend/instance-initializers/new-relic', ['exports', 'ember-new-relic/instance-initializers/new-relic'], function (exports, _emberNewRelicInstanceInitializersNewRelic) {
  Object.defineProperty(exports, 'default', {
    enumerable: true,
    get: function get() {
      return _emberNewRelicInstanceInitializersNewRelic['default'];
    }
  });
  Object.defineProperty(exports, 'initialize', {
    enumerable: true,
    get: function get() {
      return _emberNewRelicInstanceInitializersNewRelic.initialize;
    }
  });
});