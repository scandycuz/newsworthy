import Ember from 'ember';

export default Ember.Route.extend({
    model: function(params) {
      console.log(params);
      const company = this.modelFor('company');
      return this.store.query('article', { company_id: company.id });
    }
});
