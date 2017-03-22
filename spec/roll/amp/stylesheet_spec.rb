require 'spec_helper'
require 'action_view'

RSpec.describe Roll::Amp::Style::Stylesheet do
  include ActionView::Helpers::OutputSafetyHelper

  def create(assets, stylesheet_name)
    app_root = File.expand_path('../../', File.dirname(__FILE__))
    Roll::Amp::Style::Stylesheet.new(app_root, assets, stylesheet_name)
  end

  def expect_css_valid(stylesheet, content)
    css = stylesheet.read
    expect_css_has_value(css, content)
    expect(css.html_safe?).to be_truthy
    expect(css.include?('"')).to be_truthy
  end

  def expect_css_has_value(css, content)
    expected = expect(css)
    expected.not_to be_nil
    expected.not_to be_empty
    expected.to eq(content)
  end

  context 'when construction paramaters are invalid' do
    it 'initializes without error' do
      expect { create(nil, nil) }.to_not raise_error
      expect { create(nil, '') }.to_not raise_error
      expect { create(nil, 'style.css') }.to_not raise_error
      expect { create({}, 'style.css') }.to_not raise_error
      expect { create({ 'style.css' => 'body{}' }, nil) }.to_not raise_error
      expect { create({ 'style.css' => 'body{}' }, '') }.to_not raise_error
    end
  end

  context 'when stylesheet is available in pipeline' do
    let(:content) { 'body{color: #000; font-family: "Open Sans";}' }
    let(:stylesheet) { create({ 'style.css' => content }, 'style.css') }

    it 'reads valid stylesheet content from the pipeline' do
      expect_css_valid(stylesheet, content)
    end
  end

  context 'when stylesheet is not available in pipeline' do
    let(:content) do
      File.read(
        File.expand_path(
          '../../public/stylesheets/application.css',
          File.dirname(__FILE__)
        )
      )
    end
    let(:stylesheet) { create({}, 'application.css') }

    it 'reads valid stylesheet content from file' do
      expect_css_valid(stylesheet, content)
    end
  end

  context 'when stylesheet is not available anywhere' do
    let(:stylesheet) { create({}, 'fake.css') }

    it 'reads nothing and returns empty string' do
      css = stylesheet.read
      expect(css).not_to be_nil
      expect(css).to be_empty
    end
  end
end
