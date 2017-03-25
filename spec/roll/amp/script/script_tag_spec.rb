require 'spec_helper'

RSpec.describe Roll::Amp::Script::ScriptTag do
  def expect_required_attributes(html)
    expected = expect(html)
    expected.to have_tag('script[async]', text: '')
    expected.to have_tag('script[src]', text: '')
  end

  def dont_expect_custom_element(html)
    expect(html).not_to have_tag('script[custom_element]')
  end

  def create(src, custom_element = '')
    Roll::Amp::Script::ScriptTag.new(src, custom_element)
  end

  context 'when src is nil' do
    it 'initializes without error' do
      expect { create(nil) }.to_not raise_error
    end

    it 'renders script tag without src' do
      html = create(nil).to_html
      expect(html).to match(/src=""/)
      expect_required_attributes(html)
      dont_expect_custom_element(html)
    end
  end

  context 'when src is empty' do
    it 'initializes without error' do
      expect { create('') }.to_not raise_error
    end

    it 'renders script tag without src' do
      html = create('').to_html
      expect(html).to match(/src=""/)
      expect_required_attributes(html)
      dont_expect_custom_element(html)
    end
  end

  context 'when src is specified' do
    let(:src) { 'https://example.com/script.js' }
    it 'renders script tag with src' do
      html = create(src).to_html
      expect(html).to have_tag("script[src=\"#{src}\"]", text: '')
      expect_required_attributes(html)
      dont_expect_custom_element(html)
    end

    context 'when custom_element is nil' do
      it 'initializes without error' do
        expect { create(src, nil) }.to_not raise_error
      end

      it 'raises error attempting to render tag' do
        expect { create(src, nil).to_html }.to raise_error(NoMethodError)
      end
    end

    context 'when custom_element is empty' do
      it 'initializes without error' do
        expect { create(src, '') }.to_not raise_error
      end

      it 'renders script tag without custom-element attribute' do
        html = create(src, '').to_html
        dont_expect_custom_element(html)
      end
    end

    context 'when custom_element is specified' do
      let(:custom_element) { 'amp-custom' }
      it 'renders script tag with custom-element attribute' do
        html = create(src, custom_element).to_html
        expect(html).to have_tag(
          "script[custom-element=\"#{custom_element}\"]"
        )
      end
    end
  end
end
