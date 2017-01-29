define('frontend/routes/company', ['exports', 'frontend/routes/base'], function (exports, _frontendRoutesBase) {
  exports['default'] = _frontendRoutesBase['default'].extend({

    model: function model(params) {
      var _this = this;

      // retrieve company object from Rest API
      return this.store.queryRecord('company', { slug: params.company_slug }).then(function (company) {
        // retrieve the articles association from the company model
        return company.get('articles', []).then(function (articles) {
          // retrieve relevant articles from the Rest API
          return _this.store.query('article', { company_id: company.id }).then(function (retreivedArticles) {
            // push retrieved articles into the company's articles association
            retreivedArticles.forEach(function (article) {
              articles.pushObject(article);
            });
            return company;
          });
        });
      });
    }
  });
});