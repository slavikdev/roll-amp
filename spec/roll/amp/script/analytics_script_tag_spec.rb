require 'spec_helper'

RSpec.describe Roll::Amp::Script::AnalyticsScriptTag do
  it 'renders script tag' do
    html = Roll::Amp::Script::AnalyticsScriptTag.new.to_html
    expect(html).to have_tag('script[async]', text: '')
    expect(html).to have_tag(
      "script[src=\"#{Roll::Amp::Script::AnalyticsScriptTag.src}\"]",
      text: ''
    )
    expect(html).to have_tag(
      'script[custom-element="amp-analytics"]',
      text: ''
    )
  end
end
