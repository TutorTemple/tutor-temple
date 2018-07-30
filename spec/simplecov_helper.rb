require 'active_support/inflector'
require "simplecov"

class SimpleCovHelper
  def self.report_coverage(base_dir: "./coverage_results")
    SimpleCov.start 'rails' do
      skip_check_coverage = ActiveModel::Type::Boolean.new.cast(
        ENV.fetch("SKIP_COVERAGE_CHECK", "false"),
      )

      add_filter '/spec/'
      add_filter '/config/'
      add_filter '/vendor/'

      Dir['app/*'].each do |dir|
        add_group File.basename(dir).humanize, dir
      end

      minimum_coverage(95) unless skip_check_coverage
      merge_timeout(3600)
    end
    new(base_dir: base_dir).merge_results
  end

  attr_reader :base_dir

  def initialize(base_dir:)
    @base_dir = base_dir
  end

  def all_results
    Dir["#{base_dir}/.resultset*.json"]
  end

  def merge_results
    results = all_results.map { |file| SimpleCov::Result.from_hash(JSON.parse(File.read(file))) }
    SimpleCov::ResultMerger.merge_results(*results).tap do |result|
      SimpleCov::ResultMerger.store_result(result)
    end
  end
end