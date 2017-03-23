require 'spec_helper'

RSpec.describe Roll::Amp::Style::CompiledStylesheetPath do
  def create(stylesheet_name)
    create_with_app_root(@app_root, stylesheet_name)
  end

  def create_with_app_root(app_root, stylesheet_name)
    Roll::Amp::Style::CompiledStylesheetPath.new(app_root, stylesheet_name)
  end

  context 'when stylesheet name is nil' do
    let(:stylesheet_name) { nil }
    let(:path) { create(stylesheet_name) }

    it 'initializes without error' do
      expect { create(stylesheet_name) }.to_not raise_error
    end

    it 'raises error attempting to get full path' do
      expect { path.full }.to raise_error(ArgumentError)
    end
  end

  context 'when stylesheet name is empty' do
    let(:stylesheet_name) { '' }
    let(:path) { create(stylesheet_name) }
    let(:full_path) { path.full }

    it 'initializes without error' do
      expect { create(stylesheet_name) }.to_not raise_error
    end

    it 'has full path value' do
      expect(full_path).not_to be_empty
    end

    it 'has full path pointing to catalog instead of file' do
      expect(File.file?(full_path)).not_to be_truthy
    end
  end

  context 'when stylesheet name is valid' do
    let(:stylesheet_name) { 'application.css' }
    let(:path) { create(stylesheet_name) }
    let(:full_path) { path.full }

    it 'initializes without error' do
      expect { create(stylesheet_name) }.to_not raise_error
    end

    it 'has full path value' do
      expect(full_path).not_to be_empty
    end

    it 'has full path pointing to a file' do
      expect(File.file?(full_path)).to be_truthy
      expect(full_path.end_with?(stylesheet_name)).to be_truthy
    end
  end

  context 'when app root is nil' do
    let(:stylesheet_name) { 'application.css' }
    let(:app_root) { nil }
    let(:path) { create_with_app_root(app_root, stylesheet_name) }
    let(:full_path) { path.full }

    it 'initializes without error' do
      expect { create_with_app_root(app_root, stylesheet_name) }.to_not(
        raise_error
      )
    end

    it 'has full path value' do
      expect(full_path).not_to be_empty
    end

    it 'has full path pointing to a non-existent file' do
      expect(File.exist?(full_path)).not_to be_truthy
      expect(full_path.end_with?(stylesheet_name)).to be_truthy
    end
  end

  context 'when app root is empty' do
    let(:stylesheet_name) { 'application.css' }
    let(:app_root) { '' }
    let(:path) { create_with_app_root(app_root, stylesheet_name) }
    let(:full_path) { path.full }

    it 'initializes without error' do
      expect { create_with_app_root(app_root, stylesheet_name) }.to_not(
        raise_error
      )
    end

    it 'has full path value' do
      expect(full_path).not_to be_empty
    end

    it 'has full path pointing to a non-existent file' do
      expect(File.exist?(full_path)).not_to be_truthy
      expect(full_path.end_with?(stylesheet_name)).to be_truthy
    end
  end
end
