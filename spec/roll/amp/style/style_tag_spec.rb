require 'spec_helper'

RSpec.describe Roll::Amp::Style::StyleTag do
  def create(amp_attr, content)
    Roll::Amp::Style::StyleTag.new(amp_attr, content)
  end

  def expect_attr(amp_attr, content)
    html = create(amp_attr, content).to_html
    expected = expect(html)
    if amp_attr.empty?
      expected.to have_tag('style', text: content)
    else
      expected.to have_tag("style[#{amp_attr}]", text: content)
    end
  end

  context 'when initialization parameters are invalid' do
    it 'initializes without error' do
      expect { create(nil, nil) }.not_to raise_error
      expect { create(nil, '') }.not_to raise_error
      expect { create('', nil) }.not_to raise_error
      expect { create('', '') }.not_to raise_error
    end
  end

  context 'when empty parameters are specified' do
    it 'prints empty style tag' do
      html = create('', '').to_html
      expect(html).to have_tag('style', text: '')
    end
  end

  context 'when attribute and content are specified' do
    let(:amp_attr) { 'amp-custom' }
    let(:content) { 'body{}' }

    it 'prints style tag with the attribute' do
      expect_attr(amp_attr, '')
      expect_attr(amp_attr, content)
      expect_attr('', content)
    end
  end
end
