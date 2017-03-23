require 'spec_helper'

RSpec.describe Roll::Amp::Style::InternalCssFile do
  def create(file_name)
    Roll::Amp::Style::InternalCssFile.new(file_name)
  end

  context 'when file name is nil' do
    it 'initializes without error' do
      expect { create(nil) }.not_to raise_error
    end

    it 'raises error when trying to read the file' do
      expect { create(nil).read }.to raise_error(Errno::EISDIR)
    end
  end

  context 'when file name is empty' do
    it 'initializes without error' do
      expect { create('') }.not_to raise_error
    end

    it 'raises error when trying to read the file' do
      expect { create('').read }.to raise_error(Errno::EISDIR)
    end
  end

  context 'when file name is correct but unreal' do
    it 'initializes without error' do
      expect { create('fake.css') }.not_to raise_error
    end

    it 'raises error when trying to read the file' do
      expect { create('fake.css').read }.to raise_error(Errno::ENOENT)
    end
  end

  context 'when file name is correct and real' do
    it 'initializes without error' do
      expect { create('boilerplate-main.css') }.not_to raise_error
    end

    it 'reads content of the file' do
      content = create('boilerplate-main.css').read
      expect(content).to match(/^body\{.+?\-amp\-start.+\}$/)
    end
  end
end
