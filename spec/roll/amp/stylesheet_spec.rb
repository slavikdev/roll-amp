require 'spec_helper'

RSpec.describe Roll::Amp::Stylesheet do
  def create(assets, stylesheet_name)
    Roll::Amp::Stylesheet.new(assets, stylesheet_name)
  end

  # context 'when stylesheet name is nil' do
  #   let(:stylesheet_name) { nil }
  #   let(:assets) { [''] }
  #
  #   it 'initializes without error' do
  #     expect { create(assets, stylesheet_name) }.to_not raise_error
  #   end
  #
  #   it 'raises error attempting to read file content' do
  #     expect { file.read }.to raise_error(ArgumentError)
  #   end
  # end
end
