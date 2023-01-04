# frozen_string_literal: true

require_relative 'container'

require 'dry-validation'
require 'pry'
require 'securerandom'

Container.finalize!

Container['persistance.db'].freeze unless Container.development?
