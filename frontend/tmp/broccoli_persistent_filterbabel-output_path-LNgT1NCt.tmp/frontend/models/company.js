define('frontend/models/company', ['exports', 'ember-data', 'ember'], function (exports, _emberData, _ember) {
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
    articles: _emberData['default'].hasMany('article', { async: true }),
    values: _ember['default'].computed('sentiment', 'anger', 'disgust', 'fear', 'joy', 'sadness', function () {
      return {
        sentiment: this.get('sentiment') > -0.005,
        anger: this.get('anger') > -0.005,
        disgust: this.get('disgust') > -0.005,
        fear: this.get('fear') > -0.005,
        joy: this.get('joy') > 0.005,
        sadness: this.get('sadness') > -0.005
      };
    }),
    changes: _ember['default'].computed('sentiment', 'prev_sentiment', 'anger', 'prev_anger', 'disgust', 'prev_disgust', 'fear', 'prev_fear', 'joy', 'prev_joy', 'sadness', 'prev_sadness', function () {
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