require 'spec_helper'

RSpec.describe Roll::Amp::Style::NoScriptTag do
  def create(content)
    Roll::Amp::Style::NoScriptTag.new(content)
  end

  it 'renders noscript tag with empty content' do
    html = create('').to_html
    expect(html).to have_tag('noscript', text: '')
  end

  it 'renders noscript tag with nil content' do
    html = create(nil).to_html
    expect(html).to have_tag('noscript', text: '')
  end

  it 'renders noscript tag with content' do
    content = '<style></style>'
    html = create(content).to_html
    expect(html).to have_tag('noscript', text: content)
  end
end
