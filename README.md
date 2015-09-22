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
- Travis-ci should return a positive build result before a PR is merged
- CodeClimate should not report any issues before a PR is merged

The categories that are used in this project for branches are:

`feature`, `patch`, `update` and `release`

# Deployment

Deployment is automated with a heroku webhook. When a PR is merged into `master` and travis-ci returns a positive build result heroko deploys the application to [matsrietdijk-api.herokuapp.com](https://matsrietdijk-api.herokuapp.com).
