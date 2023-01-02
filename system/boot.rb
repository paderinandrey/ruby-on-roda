# frozen_string_literal: true

require_relative 'application'

require 'pry'
require 'securerandom'
require 'dry-validation'

Application.finalize!

Application['database'].loggers << Application['logger']
Application['database'].freeze unless Application.env == 'development'
