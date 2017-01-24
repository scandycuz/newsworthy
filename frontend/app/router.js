import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('companies', { path: '/' });
  this.route('company', { path: 'companies/:company_slug' });
});

export default Router;
