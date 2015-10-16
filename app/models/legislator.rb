require_relative '../../db/config'

class Legislator < ActiveRecord::Base

  def self.senator_state(input)

    state = self.where('state = ?',input).where('in_office = ?',true).where('title = ?','Sen').order('lastname')
    # puts state.map {|s| s.name}
    state.each do |legislator|
      puts "#{legislator.name}"
    end
  end

  def self.senator_party(input)

    party = self.where('party = ?',input).where('in_office=?',true).where('title=?','Sen')
    party.map do |p|
      puts p.name
    end
  end


  def self.rep_state(input)

    state = self.where('state = ?',input).where('title = ?','Rep')
    state.map do |s|
      puts s.name
    end
  end

  def self.rep_party(input)

    party = self.where('party = ?',input).where('title = ?','Rep')
    party.map do |p|
      puts p.name
    end
  end


  def self.info(attribute,first,last)
    selection = self.find_by(firstname: first, lastname: last)
    selection[attribute]
  end

  def self.in_office?(first,last)
    selection = self.find_by(firstname: first, lastname: last)
    selection.in_office

  end

  def name
    "#{firstname} #{lastname}"
  end

end