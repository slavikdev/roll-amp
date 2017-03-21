require 'spec_helper'

RSpec.describe Roll::Amp::CompiledStylesheetFile do
  def create(stylesheet_name)
    app_root = File.expand_path('../../', __dir__)
    Roll::Amp::CompiledStylesheetFile.new(app_root, stylesheet_name)
  end

  context 'when stylesheet name is nil' do
    let(:stylesheet_name) { nil }
    let(:file) { create(stylesheet_name) }

    it 'initializes without error' do
      expect { create(stylesheet_name) }.to_not raise_error
    end

    it 'raises error attempting to read file content' do
      expect { file.read }.to raise_error(ArgumentError)
    end
  end

  context 'when stylesheet name is empty' do
    let(:stylesheet_name) { '' }
    let(:file) { create(stylesheet_name) }
    let(:content) { file.read }

    it 'initializes without error' do
      expect { create(stylesheet_name) }.to_not raise_error
    end

    it 'doesn\'t have content' do
      expect(content).to be_empty
    end
  end

  context 'when stylesheet name is valid' do
    let(:stylesheet_name) { 'application.css' }
    let(:file) { create(stylesheet_name) }
    let(:content) { file.read }

    it 'initializes without error' do
      expect { create(stylesheet_name) }.to_not raise_error
    end

    it 'has content' do
      expect(content).not_to be_empty
    end
  end
end
