# My API

This repo contains my personal API which can be used to retrieve information about what I have done and what I am doing.

# Code Status

[![Build Status](https://travis-ci.org/matsrietdijk/matsrietdijk-api.svg?branch=master)](https://travis-ci.org/matsrietdijk/matsrietdijk-api)
[![Code Climate](https://codeclimate.com/github/matsrietdijk/matsrietdijk-api/badges/gpa.svg)](https://codeclimate.com/github/matsrietdijk/matsrietdijk-api)
[![Test Coverage](https://codeclimate.com/github/matsrietdijk/matsrietdijk-api/badges/coverage.svg)](https://codeclimate.com/github/matsrietdijk/matsrietdijk-api/coverage)
[![Dependency Status](https://gemnasium.com/matsrietdijk/matsrietdijk-api.svg)](https://gemnasium.com/matsrietdijk/matsrietdijk-api)

# Flow

Within this project the following flow is used regarding version/source control:

- All changes are made and committed on a dedicated branch (except documentation changes)
- Branches are categorized by prefixing the branch name, example: `feature/flow`
- Pull Requests (PR) are used to merge changes into the `master` branch
- Before a PR is merged:
  - [Travis-CI](https://travis-ci.org/matsrietdijk/matsrietdijk-api/pull_requests) should return a positive build result
  - [CodeClimate](https://codeclimate.com/github/matsrietdijk/matsrietdijk-api/branches) should not report any issues
  - RuboCop should not report any offences

The categories that are used in this project for branches are:

`feature`, `patch`, `update` and `release`

# Deployment

Deployment is automated with a Heroku webhook. When a PR is merged into `master` and Travis-CI returns a positive build result Heroku deploys
the application to [matsrietdijk-api.herokuapp.com](https://matsrietdijk-api.herokuapp.com).

Commits containing `[ci skip]` will not be deployed automatically as Travis-CI ignores these commits and therefor never returns a build status.

Deploying your own version of this application to Heroku, completely free of charge, is as easy as clicking the deploy button below.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

# Sidekiq

[Sidekiq](http://sidekiq.org) is used to perform tasks (called jobs) outside the web process, this to avoid blocking requests. Sidekiq depends on Redis to store its job queue.

Configure Sidekiq with:

- `REDIS_URL`: the URL to your Redis instance, default: `redis://0.0.0.0:6379`
- `REDIS_NAMESPACE`: set to use a custom namespace, default: `matsrietdijk-api-#{Rails.env}`

# Airbrake

[Airbrake](https://airbrake.io) is used to report runtime errors, which it does by sending a notice to the configured Airbrake host whenever an error is not caught by the application.
By default Airbrake is turned off, to enable Airbrake at least set the API key.

Configure Airbrake with:

- `AIRBRAKE_API_KEY`: your personal API key provided by your Airbrake host
- `AIRBRAKE_HOST`: the notice receiving host, default: `api.airbrake.io`
- `AIRBRAKE_PORT`: the port to send the notice to, default: `80` unless secure is `true` then `443`
- `AIRBRAKE_SECURE`: set to `true` when using a secure connection, default: `false` unless port is `443` then `true`
- `AIRBRAKE_SIDEKIQ`: set to `true` to use Sidekiq to handle notices, default: `false`
- `AIRBRAKE_DEV`: set to `true` to enable airbrake in `development` environment, default: `false`
