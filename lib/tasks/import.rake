require 'csv'
namespace :import do
  BASE_PATH = '/home/ubuntu/XTScore/'
  FIELDS = ['home', 'away']
  desc 'Import database from file'
  task :data => :environment do | |
    p ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = ON;")
    Dir.glob(BASE_PATH + 'matches/**/*/').each do |match_path|
      _, league_full, _, _, match_name = match_path.gsub(BASE_PATH, '').split('/')
      if match_name && !Match.where(file_path: match_path.gsub(BASE_PATH, '')).exists? && match_name.include?('Live')
        p match_path
        match_info = JSON.parse(File.read(match_path + '/match.json'))
        league = League.find_or_create_by(name: league_full.split('-')[1..-1].join(' '))
        venue = Venue.find_or_create_by(name: match_info['venueName'].underscore.gsub('_', ' '))
        teams = FIELDS.map do |key|
          country = Country.find_or_create_by(name: match_info[key]['countryName'])
          Team.find_or_create_by(name: match_info[key]['name'], country: country)
        end
        match = Match.create(home_id: teams[0].id, away_id: teams[1].id, venue: venue, league: league,
                          date: match_info['startDate'].to_date, file_path: match_path.gsub(BASE_PATH, ''),
                          time: Time.parse(match_info['startTime'] + 'UTC'))
        players = {}
        FIELDS.each_with_index do |field, i|
          match_info[field]['players'].each do |player_stat|
            player = Player.find_or_create_by(id: player_stat['playerId'])
            player.update(name: player_stat['name'])
            player_info = PlayerInfo.find_or_create_by(weight: player_stat['weight'], height: player_stat['height'],
                                                       player: player, shirt_no: player_stat['shirtNo'], team: teams[i])
            players[player.id] = player_info
          end
        end
        match_stats = {}
        CSV.foreach(match_path + '/match.csv', :headers => true) do |row|
          params = {}
          row.each do |key, value|
            if key == 'position'
              params[key] = Position.find_or_create_by(name: value)
            elsif key == 'id'
              params['player'] = players[value.to_i]
            elsif !%w(id team name position).include?(key)
              params[key.underscore] = value
            end
          end
          params['team'] = params['player'].team
          match_stats[params['player'].player_id] = MatchStat.find_or_create_by(match: match, team: params['team'], player: params['player'].player)
          match_stats[params['player'].player_id].update(params.except('player'))
        end

        CSV.foreach(match_path + '/rating.csv', :headers => true) do |row|
          params = {}
          row.each do |key, value|
            unless %w(id team name position).include?(key)
              params[key.underscore] = value
            end
          end
          params['player'] = players[row['id'].to_i]
          params['team'] = params['player'].team
          match_stats[params['player'].player_id].update(params.except('player'))
        end
      end
    end
  end
end
