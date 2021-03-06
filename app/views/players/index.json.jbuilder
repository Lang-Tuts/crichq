json.array!(@players) do |player|
  json.extract! player, :id, :first_name, :last_name, :bowling_type, :batting_hand, :bowling_hand, :keeper, :teams
  json.url player_url(player, format: :json)
end
