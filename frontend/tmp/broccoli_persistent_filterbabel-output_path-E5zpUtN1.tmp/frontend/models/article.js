define('frontend/models/article', ['exports', 'ember-data'], function (exports, _emberData) {
  exports['default'] = _emberData['default'].Model.extend({
    company: _emberData['default'].belongsTo('company'),
    title: _emberData['default'].attr('string'),
    url: _emberData['default'].attr('string'),
    sentiment: _emberData['default'].attr('number'),
    anger: _emberData['default'].attr('number'),
    disgust: _emberData['default'].attr('number'),
    fear: _emberData['default'].attr('number'),
    joy: _emberData['default'].attr('number'),
    sadness: _emberData['default'].attr('number'),
    company_id: _emberData['default'].attr('number')
  });
});