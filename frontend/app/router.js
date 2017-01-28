import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('companies', { path: '/' });
  this.route('articles', { path: 'articles' });
  this.route('company', { path: 'companies/:company_slug' });
  this.route('article', { path: 'articles/:article_id'});
});

export default Router;
