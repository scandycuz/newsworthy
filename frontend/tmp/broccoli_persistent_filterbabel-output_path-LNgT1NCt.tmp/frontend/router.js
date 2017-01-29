define('frontend/router', ['exports', 'ember', 'frontend/config/environment'], function (exports, _ember, _frontendConfigEnvironment) {

  var Router = _ember['default'].Router.extend({
    location: _frontendConfigEnvironment['default'].locationType,
    rootURL: _frontendConfigEnvironment['default'].rootURL
  });

  Router.map(function () {
    this.route('companies', { path: '/' });
    this.route('articles', { path: 'articles' });
    this.route('company', { path: 'companies/:company_slug' });
    this.route('article', { path: 'articles/:article_id' });
  });

  exports['default'] = Router;
});