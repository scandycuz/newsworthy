define('frontend/models/company', ['exports', 'ember-data'], function (exports, _emberData) {
  exports['default'] = _emberData['default'].Model.extend({
    title: _emberData['default'].attr('string'),
    symbol: _emberData['default'].attr('string'),
    slug: _emberData['default'].attr('string'),
    sentiment: _emberData['default'].attr('number'),
    anger: _emberData['default'].attr('number'),
    disgust: _emberData['default'].attr('number'),
    fear: _emberData['default'].attr('number'),
    joy: _emberData['default'].attr('number'),
    sadness: _emberData['default'].attr('number'),
    prev_sentiment: _emberData['default'].attr('number'),
    prev_anger: _emberData['default'].attr('number'),
    prev_disgust: _emberData['default'].attr('number'),
    prev_fear: _emberData['default'].attr('number'),
    prev_joy: _emberData['default'].attr('number'),
    prev_sadness: _emberData['default'].attr('number'),
    changes: Ember.computed('sentiment', 'prev_sentiment', 'anger', 'prev_anger', 'disgust', 'prev_disgust', 'fear', 'prev_fear', 'joy', 'prev_joy', 'sadness', 'prev_sadness', function () {
      return {
        sentiment: this.get('sentiment') > this.get('prev_sentiment'),
        anger: this.get('anger') > this.get('prev_anger'),
        disgust: this.get('disgust') > this.get('prev_disgust'),
        fear: this.get('fear') > this.get('prev_fear'),
        joy: this.get('joy') > this.get('prev_joy'),
        sadness: this.get('sadness') > this.get('prev_sadness')
      };
    })
  });
});