require 'spec_helper'

RSpec.describe Roll::Amp::Style::BoilerplateStyleTagsSet do
  def tag
    Roll::Amp::Style::BoilerplateStyleTagsSet.new
  end

  it 'renders style tags' do
    html = tag.to_html
    expect(html).to have_tag(
      'style[amp-boilerplate]',
      /^body\{.+?\-amp\-start.+\}$/
    )
    expect(html).to have_tag('noscript') do
      with_tag(
        'style[amp-boilerplate]',
        /^body\{.+?animation\:none.*\}$/
      )
    end
  end
end
