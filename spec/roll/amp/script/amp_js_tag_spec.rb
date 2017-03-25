require 'spec_helper'

RSpec.describe Roll::Amp::Script::AmpJsTag do
  it 'renders script tag' do
    html = Roll::Amp::Script::AmpJsTag.new.to_html
    expect(html).to have_tag('script[async]', text: '')
    expect(html).to have_tag(
      "script[src=\"#{Roll::Amp::Script::AmpJsTag.src}\"]",
      text: ''
    )
  end
end
