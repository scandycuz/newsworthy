import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.get('store').findAll('company');
  },
  actions: {
    delete(company) {
      company.deleteRecord();
      company.save();
    }
  }
});
