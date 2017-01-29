import Ember from 'ember';

export default Ember.Route.extend({

  model: function(params) {
    // retrieve company object from Rest API
    return this.store.queryRecord('company', {slug: params.company_slug})
    .then((company) => {
      // retrieve the articles association from the company model
      return company.get('articles', [])
      .then((articles) => {
        // retrieve relevant articles from the Rest API
        return this.store.query('article', { company_id: company.id })
        .then((retreivedArticles) => {
          // push retrieved articles into the company's articles association
          retreivedArticles.forEach( (article) => {
            articles.pushObject(article);
          });
          return company;
        });
      });
    });
  }
});
