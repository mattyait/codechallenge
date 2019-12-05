#!/usr/bin/env ruby
require "tty-prompt"
require 'json'
require 'colorize'
require './load_data.rb'


class Application

  def prompt_initialize
    TTY::Prompt.new
  end

  def back_to_menu
    prompt = prompt_initialize
    prompt.select("") do |menu|
      menu.choice "'Enter' to Go Back", -> {menu()}
    end
  end

  # Function to search specific data set of Json
  def search_engine(entity,type)
    l=Load_data.new(entity)
    if type == "list_searchable_field"
        puts "Search #{entity} with"
        l.list_searchable_field
    else
        puts "Enter search term"
        key=gets
        puts "Enter search value"
        value=gets
        l.search_data_entity(key,value)
    end
    back_to_menu()
  end

  def search(type)
    prompt = prompt_initialize
    system "clear"
    prompt.select('Select Options: ((Use ↑/↓ arrow keys, press Enter to select)).'.yellow.underline, filter: true, per_page: 10) do |menu|
      menu.choice '1) Users ', -> {search_engine("Users",type)}
      menu.choice '2) Tickets',  -> {search_engine("Tickets",type)}
      menu.choice '3) Organizations',  -> {search_engine("Organizations",type)}
      menu.choice '4) Exit',  -> {menu()}
    end
  end

  def menu
    system "clear"
    prompt = prompt_initialize
    puts "Welcome to Search of Zendesk"
    prompt.select('Select search options: ((Use ↑/↓ arrow keys, press Enter to select)).'.yellow.underline, filter: true, per_page: 10) do |menu|
      menu.choice '* Search Zendesk', -> {search("search")}
      menu.choice '* View a list of searchable fields',  -> {search("list_searchable_field")}
      menu.choice '* Exit',  -> {system "exit"}
    end
  end
end

#=====Calling the main entry=====
system "clear"
app=Application.new()
app.menu
