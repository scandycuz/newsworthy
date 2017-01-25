import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  symbol: DS.attr('string'),
  slug: DS.attr('string'),
  sentiment: DS.attr('number'),
  anger: DS.attr('number'),
  disgust: DS.attr('number'),
  fear: DS.attr('number'),
  joy: DS.attr('number'),
  sadness: DS.attr('number'),
  prev_sentiment: DS.attr('number'),
  prev_anger: DS.attr('number'),
  prev_disgust: DS.attr('number'),
  prev_fear: DS.attr('number'),
  prev_joy: DS.attr('number'),
  prev_sadness: DS.attr('number'),
  changes: Ember.computed('sentiment', 'prev_sentiment',
  'anger', 'prev_anger', 'disgust', 'prev_disgust',
  'fear', 'prev_fear', 'joy', 'prev_joy',
  'sadness', 'prev_sadness', function() {
    return {
      sentiment: this.get('sentiment') > this.get('prev_sentiment'),
      anger: this.get('anger') > this.get('prev_anger'),
      disgust: this.get('disgust') > this.get('prev_disgust'),
      fear: this.get('fear') > this.get('prev_fear'),
      joy: this.get('joy') > this.get('prev_joy'),
      sadness: this.get('sadness') > this.get('prev_sadness')
    }
  })
});
