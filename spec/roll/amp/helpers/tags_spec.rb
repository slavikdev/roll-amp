require 'spec_helper'
require 'rails'
require 'json'
require_relative 'fake_rails_app'

RSpec.describe Roll::Amp::Helpers::Tags do
  include Roll::Amp::Helpers::Tags

  before(:each) do
    allow(Rails).to receive(:root) { @app_root }
  end

  def stub_empty_assets
    fake_app = FakeRailsApp.new({})
    allow(Rails).to receive(:application) { fake_app }
  end

  def expect_html(html, expected)
    expect(html).to have_tag('style[amp-custom]', text: expected)
  end

  context 'amp_boilerplate' do
    it 'renders style tags with boilerplate css' do
      html = amp_boilerplate
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

  context 'amp_custom_style' do
    it 'renders style tag from assets hash' do
      content = 'body{color:#123;}'
      file_name = 'style.css'
      fake_app = FakeRailsApp.new(file_name => content)
      allow(Rails).to receive(:application) { fake_app }
      html = amp_custom_style(file_name)
      expect_html(html, content)
    end

    it 'renders style tag from file' do
      content = File.read(
        "#{@app_root}/public/stylesheets/application.css"
      )
      file_name = 'application.css'
      stub_empty_assets
      html = amp_custom_style(file_name)
      expect_html(html, content)
    end

    context 'when file name is nil' do
      it 'raises error' do
        stub_empty_assets
        expect { amp_custom_style(nil) }.to raise_error
      end
    end

    context 'when file name is empty' do
      it 'renders empty tag' do
        stub_empty_assets
        html = amp_custom_style('')
        expect_html(html, '')
      end
    end

    context 'when file name points to non-existent file' do
      it 'renders empty tag' do
        stub_empty_assets
        html = amp_custom_style('fake.css')
        expect_html(html, '')
      end
    end
  end

  context 'amp_js' do
    it 'renders script tag' do
      html = amp_js
      expect(html).to have_tag('script[async]', text: '')
      expect(html).to have_tag('script[src]', text: '')
    end
  end

  context 'amp_analytics_js' do
    it 'renders script tag' do
      html = amp_analytics_js
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

  context 'amp_google_analytics' do
    let(:account) { 'UA-00000-1' }
    let(:triggers) do
      {
        trackPageviewWithCustomUrl: {
          on: 'visible',
          request: 'pageview',
          vars: {
            title: 'My page',
            documentLocation: 'https://www.examplepetstore.com/pets.html'
          }
        }
      }
    end

    it 'renders analytics tag' do
      html = amp_google_analytics(account, triggers)
      expect(html).to have_tag(
        "amp-analytics[type=\"#{Roll::Amp::Html::GoogleAnalyticsTag.type}\"]"
      ) do
        with_tag(
          "script[type=\"#{Roll::Amp::Script::JsonScriptTag.type}\"]",
          text: {
            vars: {
              account: account
            },
            triggers: triggers
          }.to_json
        )
      end
    end
  end
end
