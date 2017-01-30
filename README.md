# Stock Sentiment

Stock Sentiment is application designed to keep track of the current sentiment and emotional reaction to companies listed on NASDAQ. It uses the [Intrinio](https://intrinio.com/) News API to pull recent news articles about each company, and IBM's [Watson Alchemy API](http://www.alchemyapi.com/) to analyze the sentiment and emotion in the articles. The application then records a running average of those values for each company and also tracks recent changes.

[Live Here][live]

[live]: http://www.stocksentiment.info/

## Features

* Daily rake tasks connect to the Intrinio and Alchemy RESTful API's to pull and analyze relevant data
* The Rails back-end keeps a running average of data from the most recent articles and tracks the trajectory of the sentiment and emotional data
* Individual company pages provide links to the most recently retreived articles for that company, as well as a link to the company's page at MarketWatch.com

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
  * [Article](./frontend/app/article.js)
* [Templates](./frontend/app/templates)
  * [Companies Index](./frontend/app/templates/companies.hbs)
  * [Company Page](./frontend/app/templates/company.hbs)

## Languages, Frameworks, Libraries, Etc.

* EmberJS
* Ruby on Rails
* PostgreSQL
* Gems
  * friendly_id
  * jbuilder

## Future Implementations

There are a number of features that I would like to add to the application:

* Search for specific stocks
* Pagination with a load on scroll feature to improve load time
* Sort and filter functionality to locate specific ranges of data
