require 'spec_helper'

RSpec.describe Roll::Amp::Style::CustomStyleTag do
  def create(content)
    Roll::Amp::Style::CustomStyleTag.new(content)
  end

  it 'renders style tag with empty content' do
    html = create('').to_html
    expect(html).to have_tag('style[amp-custom]', text: '')
  end

  it 'renders style tag with nil content' do
    html = create(nil).to_html
    expect(html).to have_tag('style[amp-custom]', text: '')
  end

  it 'renders style tag with content' do
    content = 'body{color:#fff;}'
    html = create(content).to_html
    expect(html).to have_tag('style[amp-custom]', text: content)
  end
end
