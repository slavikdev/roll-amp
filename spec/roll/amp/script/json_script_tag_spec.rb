require 'spec_helper'

RSpec.describe Roll::Amp::Script::JsonScriptTag do
  def create(content)
    Roll::Amp::Script::JsonScriptTag.new(content)
  end

  def expect_content(content)
    html = create(content).to_html
    expect(html).to have_tag(
      "script[type=\"#{Roll::Amp::Script::JsonScriptTag.type}\"]",
      text: content
    )
  end

  it 'renders script tag with empty content' do
    expect_content('')
  end

  it 'renders script tag with nil content' do
    expect_content(nil)
  end

  it 'renders script tag with content' do
    content = '{
      "vars": {
        "account": "UA-XXXXX-Y"
      },
      "triggers": {
        "trackPageview": {
          "on": "visible",
          "request": "pageview"
        }
      }
    }'
    expect_content(content)
  end
end
