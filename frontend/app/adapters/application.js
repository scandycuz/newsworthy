import DS from 'ember-data';
import config from '../config/environment';
import CustomAdapter from './custom-adapter';

let adapter = DS.RESTAdapter.extend({
  host: 'http://localhost:3000',
  namespace: 'api'
});

if (config.environment === 'production') {
    adapter = CustomAdapter;
}

export default adapter;
