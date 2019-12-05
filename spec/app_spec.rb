require 'spec_helper.rb'

RSpec.describe TTY::Prompt, 'menu' do

  subject(:prompt) { TTY::TestPrompt.new }

  it 'menu' do
      prompt.ask('What is your name?')
      expect(prompt.output.string).to eq([
        "What is your name? ",
        "\e[1A\e[2K\e[1G",
        "What is your name? \n"
      ].join)
    end

end
