require 'matchdoc/matcher'

RSpec::Matchers.define :match_template do |expected|
  match_unless_raises Matchdoc::Matcher::FailedChunk do |actual|
    Matchdoc::Matcher.new(expected).match!(actual)
  end

  def diffable?
    true
  end

  failure_message do
    @rescued_exception.message
  end
end
