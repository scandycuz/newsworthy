define('frontend/routes/base', ['exports', 'ember', 'frontend/mixins/reset-scroll-position'], function (exports, _ember, _frontendMixinsResetScrollPosition) {
  exports['default'] = _ember['default'].Route.extend(_frontendMixinsResetScrollPosition['default'], {});
});