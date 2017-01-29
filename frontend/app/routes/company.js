import BaseRoute from './base';

export default BaseRoute.extend({

  model: function(params) {
    return this.store.queryRecord('company', {slug: params.company_slug});
  }
});
