# frozen_string_literal: true

workers Integer(ENV['WEB_CONCURRENCY'] || 0)
threads_count = Integer(ENV['PUMA_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup if defined?(DefaultRackup)
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'
