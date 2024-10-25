require 'net/http'
require 'json'

class RiotApiService
  RIOT_API_BASE_URL = 'https://americas.api.riotgames.com'
#   SUMMONER_API_BASE_URL = 'https://na1.api.riotgames.com'
  user = 'Frogen'
  tagLine = 'NA1'

  def self.get_account_by_riot_id(game_name, tag_line)
    url = URI("#{RIOT_API_BASE_URL}/riot/account/v1/accounts/by-riot-id/#{game_name}/#{tag_line}?api_key=#{ENV['RIOT_API_KEY']}")
    response = Net::HTTP.get(url)
    JSON.parse(response)
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  def self.get_summoner_by_puuid(puuid)
    url = URI("#{SUMMONER_API_BASE_URL}/lol/summoner/v4/summoners/by-puuid/#{puuid}?api_key=#{ENV['RIOT_API_KEY']}")
    response = Net::HTTP.get(url)
    JSON.parse(response)
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  def self.get_matchlist_by_puuid(puuid)
    url = URI("#{RIOT_API_BASE_URL}/tft/match/v1/matches/by-puuid/#{puuid}/ids?api_key=#{RIOT_API_KEY}")
    response = Net::HTTP.get(url)
    JSON.parse(response)
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  def self.get_match_data(match_id)
    url = URI("#{RIOT_API_BASE_URL}/tft/match/v1/matches/#{match_id}?api_key=#{ENV['RIOT_API_KEY']}")
    response = Net::HTTP.get(url)
    JSON.parse(response)
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end
