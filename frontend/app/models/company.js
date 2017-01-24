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
  sadness: DS.attr('number')
});
