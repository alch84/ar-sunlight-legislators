class Legislator < ActiveRecord::Base

  def state(input)

    state = self.where('state =?',input)

  end

  def party(party)
    self.party
  end

end