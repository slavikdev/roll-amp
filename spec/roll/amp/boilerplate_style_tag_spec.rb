require 'spec_helper'

RSpec.describe Roll::Amp::Style::BoilerplateStyleTag do
  def create(css_file_name)
    Roll::Amp::Style::BoilerplateStyleTag.new(css_file_name)
  end

  context 'when css file name is nil' do
    it 'initializes with error' do
      expect { create(nil) }.to raise_error(Errno::EISDIR)
    end
  end

  context 'when css file name is empty' do
    it 'initializes with error' do
      expect { create('') }.to raise_error(Errno::EISDIR)
    end
  end

  context 'when css file name is correct but such file doesn\'t exist' do
    it 'initializes with error' do
      expect { create('fake.css') }.to raise_error(Errno::ENOENT)
    end
  end

  context 'when css file name is correct and such file exists' do
    let(:css_file_name) { 'boilerplate-main.css' }
    let(:tag) { create(css_file_name) }

    it 'initializes without error' do
      expect { create(css_file_name) }.not_to raise_error
    end

    it 'renders tag with content' do
      html = tag.to_html
      expect(html).to have_tag(
        'style[amp-boilerplate]',
        /^body\{.+\}/
      )
    end
  end
end
