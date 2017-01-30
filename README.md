# Stock Sentiment

Stock Sentiment is application designed to keep track of the current sentiment and emotional reaction to companies listed on NASDAQ. It uses the [Intrinio](https://intrinio.com/) News API to pull recent news articles about each company, and IBM's Watson [Alchemy](http://www.alchemyapi.com/) API to analyze the sentiment and emotion in the articles. The application then records a running average of those values for each company and also tracks recent changes.

[Live Here][live]

[live]: http://www.stocksentiment.info/

## Features

* Daily rake tasks connect to the Intrinio and Alchemy RESTful API's to pull and analyze relevant data
* The Rails back-end keeps a running average of the most recent sentiment and emotional data and tracks their trajectories
* Individual company pages provide links for the most recently retreived articles, as well as a link to the company's page at MarketWatch.com

## Code Guide

If you'd like to take a closer look at the code behind Stock Sentiment, the best folders to look in are:

* [API Services](./app/services)
  * [Intrinio API](./app/services/intrinio_api.rb)
  * [Alchemy API](./app/services/alchemy_api.rb)
* [Helpers](./frontend/app/helpers)
  * [Calculate Change](./frontend/app/helpers/calculate-change.js)
  * [Is Positive](./frontend/app/helpers/is-positive.js)
* [Models](./frontend/app/models)
  * [Company](./frontend/app/models/company.js)
  * [Article](./frontend/app/models/article.js)
* [Templates](./frontend/app/templates)
  * [Companies Index](./frontend/app/templates/companies.hbs)
  * [Company Page](./frontend/app/templates/company.hbs)

## Languages, Frameworks, Libraries, Etc.

* EmberJS
* Ruby on Rails
* PostgreSQL
* Ember Addons
  * ember-font-awesome
  * ember-cli-bourbon
  * ember-cli-neat
* Gems
  * friendly_id
  * jbuilder

## Future Implementations

There are a number of features that I would like to add to the application in the future:

* Search feature to locate specific stocks
* Pagination with a load on scroll feature to improve initial load time
* Sort and filter functionality
* Create graphs for each company using collected data-points to illustrate sentiment and emotional data over time
