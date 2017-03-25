require 'spec_helper'

RSpec.describe Roll::Amp::Html::GoogleAnalyticsTag do
  def create(content)
    Roll::Amp::Html::GoogleAnalyticsTag.new(content)
  end

  def expect_tag(content)
    html = create(content).to_html
    expected = expect(html)
    expected.to have_tag(
      "amp-analytics[type=\"#{Roll::Amp::Html::GoogleAnalyticsTag.type}\"]",
      text: content
    )
  end

  context 'when content is invalid' do
    it 'initializes without error' do
      expect { create(nil) }.not_to raise_error
      expect { create('') }.not_to raise_error
    end
  end

  context 'when content is empty' do
    it 'prints empty analytics tag' do
      expect_tag('')
    end
  end

  context 'when content is specified' do
    let(:content) { 'some-content' }
    it 'prints analytics tag with the specified content' do
      expect_tag(content)
    end
  end
end
