define('frontend/models/company', ['exports', 'ember-data'], function (exports, _emberData) {
  exports['default'] = _emberData['default'].Model.extend({
    title: _emberData['default'].attr('string'),
    rating: _emberData['default'].attr('number'),
    slug: _emberData['default'].attr('string')
  });
});