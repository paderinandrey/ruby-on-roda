# frozen_string_literal: true

require_relative 'app'

use Rack::Attack

run App.freeze.app
