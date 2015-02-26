require 'rspec'
require 'matchdoc/rspec'

describe Matchdoc::Matcher do
 
  let(:matchdocument) { <<-TEMPLATE
    title, name, #{/[a-z]+/}
    Title, #{/(.{0,10}?,)/} #{/[0-9]/}
  TEMPLATE
  }

  let(:successful_doc) { <<-TEMPLATE
    title, name, something
    Title, something, 2
  TEMPLATE
  }

  let(:failing_doc_on_first_chunk) { <<-TEMPLATE
    title, name, Something
    Title, something, 2
  TEMPLATE
  }

  let(:failing_doc_on_second_chunk) { <<-TEMPLATE
    title, name, something
    Title, somethingentirelytolong, 2
  TEMPLATE
  }

  let(:failing_doc_on_third_chunk) { <<-TEMPLATE
    title, name, something
    Title, something, Q
  TEMPLATE
  }

  subject { Matchdoc::Matcher.new(matchdocument) }

  it 'matches a document template' do
    expect(subject.match!(successful_doc)).to be_truthy
  end

  context 'when it fails on the first chunk' do
    it 'fails to match a document template' do
      expect { subject.match!(failing_doc_on_first_chunk) }
      .to raise_error(Matchdoc::Matcher::FailedChunk, "Expected `Something\n    ` to match `(?-mix:[a-z]+)`")
    end
  end

  context 'when it fails on the second chunk' do
    it 'fails to match a document template' do
      expect { subject.match!(failing_doc_on_second_chunk) }
      .to raise_error(Matchdoc::Matcher::FailedChunk, "Expected `somethingentirelyto` to match `(?-mix:(.{0,10}?,))`")
    end
  end

  context 'when it fails on the third chunk' do
    it 'fails to match a document template' do
      expect { subject.match!(failing_doc_on_third_chunk) }
      .to raise_error(Matchdoc::Matcher::FailedChunk, "Expected `Q\n` to match `(?-mix:[0-9])`")
    end
  end

  context 'it can use the matchy operator' do
    it 'returns true' do
      expect(subject =~ successful_doc).to be true
    end

    it 'returns false' do
      expect(subject =~ failing_doc_on_first_chunk).to be false
    end
  end

  describe 'to_s' do
    it 'returns a string rep of the match template' do
      expect(subject.to_s).to eq "/    title, name, //(?-mix:[a-z]+)//\n    Title, //(?-mix:(.{0,10}?,))// //(?-mix:[0-9])/" 
    end
  end
end
