module TeamsHelper

  def header(id, param)
      if id == 1
      "Bowling Type #{params.values[0].titleize} Players"
    elsif id == 6
      "Batting Hand #{params.values[0].titleize} Players"
    elsif id == 3
      "Bowling Hand #{params.values[0].titleize} Players"
    elsif id == 4
      "#{params.values[0].titleize} Players"
    elsif id == 5
      "#{@team.name.titleize} Players"
    else 
      "Nothing to display"
    end

  end

end
