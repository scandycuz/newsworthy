import DS from 'ember-data';

export default DS.Model.extend({
  company: DS.belongsTo('company'),
  title: DS.attr('string'),
  url: DS.attr('string'),
  sentiment: DS.attr('number'),
  anger: DS.attr('number'),
  disgust: DS.attr('number'),
  fear: DS.attr('number'),
  joy: DS.attr('number'),
  sadness: DS.attr('number'),
  company_id: DS.attr('number')
});
