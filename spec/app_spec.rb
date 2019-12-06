require 'spec_helper'
require './app.rb'
RSpec.describe TTY::Prompt, 'menu' do

  subject(:prompt) { TTY::TestPrompt.new }

  let(:symbols) { TTY::Prompt::Symbols.symbols }
  let(:up_down) { "#{symbols[:arrow_up]}/#{symbols[:arrow_down]}" }


  it "Search zendesk with Users selection in menu" do
      prompt.input << " "
      prompt.input.rewind
      value = prompt.select('Select search options: ((Use ↑/↓ arrow keys, press Enter to select)).') do |menu|
                menu.symbols marker: '>'

                menu.choice "* Search Zendesk"
                menu.choice "* View a list of searchable fields"
                menu.choice "* Exit"
              end
      expect(value).to eq('* Search Zendesk')
      # expect(prompt.output.string).to eq([
      #   "\e[?25lSelect search options: ((Use #{up_down} arrow keys, press Enter to select)). \e[90m",
      #   "(Users\e[0m\n",
      #   "2) Tickets\n",
      #   "3) Organizations\n",
      #   # "4) Exit"
      #   "\e[?25((Use #{up_down} arrow keys, press Enter to select)). \e[90m",
      #   "Select search options: \e[32m* Search Zendesk\e[0m\n\e[?25h"
      # ].join)
  end


    it "search with id and value 1" do
      allow($stdin).to receive(:gets).and_return('_id')
      term = $stdin.gets
      expect(term).to eq('_id')

      allow($stdin).to receive(:gets).and_return('1')
      value = $stdin.gets
      expect(value).to eq('1')
    end

end
