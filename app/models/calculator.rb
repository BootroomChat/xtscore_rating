class Calculator
  include ActiveModel::Model

  DEFAULT_CONFIG = {
      'FW': {
          'shotsAccuracyRating': {'function': 'normdist', 'params': [0.33, 0.21], 'percent': 0.2, 'per_mode': 'match',
                                  'key': 'shotsAccuracy'},
          'aerialSuccessRating': {'function': 'normdist', 'params': [0.33, 0.21], 'percent': 0.1, 'per_mode': 'match',
                                  'key': 'aerialSuccess'},
          'dribbleSuccessRating': {'function': 'normdist', 'params': [1, 1.42], 'percent': 0.05, 'per_mode': 'match',
                                   'key': 'dribbleSuccess'},
          'passesAccuracyRating': {'function': 'normdist', 'params': [0.7, 0.13], 'percent': 0.2, 'per_mode': 'match',
                                   'key': 'passesAccuracy'},
          'defenseThreeRatting': {'function': 'normdist', 'params': [1.1, 0.7], 'percent': 0.05, 'per_mode': '_minute',
                                  'key': 'defenseThree'},
          'cccPassesRating': {'function': 'multiply', 'params': 6, 'percent': 1, 'per_mode': '_minute',
                              'key': 'cccPasses'},
          'goalsRating': {'function': 'multiply', 'params': 17, 'percent': 1, 'per_mode': '_minute', 'key': 'goals'},
          'errorsRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'totalErrors'},
          'dribbledPastRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                 'key': 'dribbledPast'},
          'totalSavesRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'totalSaves'},
          'collectedRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                              'key': 'totalCollected'},
          'parriedDangerRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'totalParried'},
          'goalsConcededRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'goalsConceded'}},
      'AMC/SS': {
          'shotsAccuracyRating': {'function': 'normdist', 'params': [0.3, 0.09], 'percent': 0.05, 'per_mode': 'match',
                                  'key': 'shotsAccuracy'},
          'aerialSuccessRating': {'function': 'normdist', 'params': [0.3, 0.09], 'percent': 0.05, 'per_mode': 'match',
                                  'key': 'aerialSuccess'},
          'dribbleSuccessRating': {'function': 'normdist', 'params': [2, 1.42], 'percent': 0.15, 'per_mode': 'match',
                                   'key': 'dribbleSuccess'},
          'passesAccuracyRating': {'function': 'normdist', 'params': [0.8, 0.12], 'percent': 0.2, 'per_mode': 'match',
                                   'key': 'passesAccuracy'},
          'defenseThreeRatting': {'function': 'normdist', 'params': [1.5, 0.43], 'percent': 0.1, 'per_mode': '_minute',
                                  'key': 'defenseThree'},
          'cccPassesRating': {'function': 'multiply', 'params': 5, 'percent': 1, 'per_mode': '_minute',
                              'key': 'cccPasses'},
          'goalsRating': {'function': 'multiply', 'params': 25, 'percent': 1, 'per_mode': '_minute', 'key': 'goals'},
          'errorsRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'totalErrors'},
          'dribbledPastRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                 'key': 'dribbledPast'},
          'totalSavesRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'totalSaves'},
          'collectedRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                              'key': 'totalCollected'},
          'parriedDangerRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'totalParried'},
          'goalsConcededRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'goalsConceded'}},
      'WF/IF': {
          'shotsAccuracyRating': {'function': 'normdist', 'params': [0.33, 0.15], 'percent': 0.05, 'per_mode': 'match',
                                  'key': 'shotsAccuracy'},
          'aerialSuccessRating': {'function': 'normdist', 'params': [0.3, 0.09], 'percent': 0.05, 'per_mode': 'match',
                                  'key': 'aerialSuccess'},
          'dribbleSuccessRating': {'function': 'normdist', 'params': [2, 1.42], 'percent': 0.15, 'per_mode': 'match',
                                   'key': 'dribbleSuccess'},
          'passesAccuracyRating': {'function': 'normdist', 'params': [0.75, 0.08], 'percent': 0.15, 'per_mode': 'match',
                                   'key': 'passesAccuracy'},
          'defenseThreeRatting': {'function': 'normdist', 'params': [1.5, 0.75], 'percent': 0.1, 'per_mode': '_minute',
                                  'key': 'defenseThree'},
          'cccPassesRating': {'function': 'multiply', 'params': 6.25, 'percent': 1, 'per_mode': '_minute',
                              'key': 'cccPasses'},
          'goalsRating': {'function': 'multiply', 'params': 20, 'percent': 1, 'per_mode': '_minute', 'key': 'goals'},
          'errorsRating': {'function': 'minus_multiply', 'params': 25, 'percent': 0.05, 'per_mode': 'minute',
                           'key': 'totalErrors'},
          'dribbledPastRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                 'key': 'dribbledPast'},
          'totalSavesRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'totalSaves'},
          'collectedRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                              'key': 'totalCollected'},
          'parriedDangerRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'totalParried'},
          'goalsConcededRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'goalsConceded'}},
      'CM/LCM/RCM': {
          'aerialSuccessRating': {'function': 'normdist', 'params': [0.5, 0.21], 'percent': 0.05, 'per_mode': 'match',
                                  'key': 'aerialSuccess'},
          'dribbleSuccessRating': {'function': 'normdist', 'params': [3, 1.5], 'percent': 0.1, 'per_mode': 'match',
                                   'key': 'dribbleSuccess'},
          'passesAccuracyRating': {'function': 'normdist', 'params': [0.83, 0.08], 'percent': 0.2, 'per_mode': 'match',
                                   'key': 'passesAccuracy'},
          'defenseThreeRatting': {'function': 'normdist', 'params': [3, 2.29], 'percent': 0.25, 'per_mode': '_minute',
                                  'key': 'defenseThree'},
          'cccPassesRating': {'function': 'multiply', 'params': 5, 'percent': 1, 'per_mode': '_minute',
                              'key': 'cccPasses'},
          'goalsRating': {'function': 'multiply', 'params': 20, 'percent': 1, 'per_mode': '_minute', 'key': 'goals'},
          'errorsRating': {'function': 'minus_multiply', 'params': 15, 'percent': 0.1, 'per_mode': 'minute',
                           'key': 'totalErrors'},
          'dribbledPastRating': {'function': 'minus_multiply', 'params': 5, 'percent': 0.05, 'per_mode': '_minute',
                                 'key': 'dribbledPast'},
          'shotsAccuracyRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                  'key': 'shotsAccuracy'},
          'totalSavesRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'totalSaves'},
          'collectedRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                              'key': 'totalCollected'},
          'parriedDangerRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'totalParried'},
          'goalsConcededRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'goalsConceded'}},
      'DM': {
          'aerialSuccessRating': {'function': 'normdist', 'params': [0.4, 0.21], 'percent': 0.1, 'per_mode': 'match',
                                  'key': 'aerialSuccess'},
          'passesAccuracyRating': {'function': 'normdist', 'params': [0.85, 0.08], 'percent': 0.2, 'per_mode': 'match',
                                   'key': 'passesAccuracy'},
          'defenseThreeRatting': {'function': 'normdist', 'params': [6.5, 3.6], 'percent': 0.3, 'per_mode': '_minute',
                                  'key': 'defenseThree'},
          'cccPassesRating': {'function': 'multiply', 'params': 5, 'percent': 1, 'per_mode': '_minute',
                              'key': 'cccPasses'},
          'goalsRating': {'function': 'multiply', 'params': 25, 'percent': 1, 'per_mode': '_minute', 'key': 'goals'},
          'errorsRating': {'function': 'minus_multiply', 'params': 25, 'percent': 0.15, 'per_mode': 'minute',
                           'key': 'totalErrors'},
          'dribbledPastRating': {'function': 'minus_multiply', 'params': 4, 'percent': 0.1, 'per_mode': '_minute',
                                 'key': 'dribbledPast'},
          'shotsAccuracyRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                  'key': 'shotsAccuracy'},
          'dribbleSuccessRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                   'key': 'dribbleSuccess'},
          'totalSavesRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'totalSaves'},
          'collectedRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                              'key': 'totalCollected'},
          'parriedDangerRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'totalParried'},
          'goalsConcededRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'goalsConceded'}},
      'DL/DR': {
          'aerialSuccessRating': {'function': 'normdist', 'params': [0.5, 0.21], 'percent': 0.05, 'per_mode': 'match',
                                  'key': 'aerialSuccess'},
          'dribbleSuccessRating': {'function': 'normdist', 'params': [1, 0.7], 'percent': 0.15, 'per_mode': 'match',
                                   'key': 'dribbleSuccess'},
          'passesAccuracyRating': {'function': 'normdist', 'params': [0.75, 0.08], 'percent': 0.1, 'per_mode': 'match',
                                   'key': 'passesAccuracy'},
          'defenseThreeRatting': {'function': 'normdist', 'params': [8, 3.6], 'percent': 0.3, 'per_mode': '_minute',
                                  'key': 'defenseThree'},
          'cccPassesRating': {'function': 'multiply', 'params': 5, 'percent': 1, 'per_mode': '_minute',
                              'key': 'cccPasses'},
          'goalsRating': {'function': 'multiply', 'params': 25, 'percent': 1, 'per_mode': '_minute', 'key': 'goals'},
          'errorsRating': {'function': 'minus_multiply', 'params': 15, 'percent': 0.09, 'per_mode': '_minute',
                           'key': 'totalErrors'},
          'dribbledPastRating': {'function': 'minus_multiply', 'params': 8, 'percent': 0.16, 'per_mode': '_minute',
                                 'key': 'dribbledPast'},
          'shotsAccuracyRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                  'key': 'shotsAccuracy'},
          'totalSavesRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'totalSaves'},
          'collectedRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                              'key': 'totalCollected'},
          'parriedDangerRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'totalParried'},
          'goalsConcededRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'goalsConceded'}},
      'DC': {
          'aerialSuccessRating': {'function': 'normdist', 'params': [0.5, 0.21], 'percent': 0.25, 'per_mode': 'match',
                                  'key': 'aerialSuccess'},
          'passesAccuracyRating': {'function': 'normdist', 'params': [0.8, 0.08], 'percent': 0.1, 'per_mode': 'match',
                                   'key': 'passesAccuracy'},
          'defenseThreeRatting': {'function': 'normdist', 'params': [10, 7], 'percent': 0.3, 'per_mode': '_minute',
                                  'key': 'defenseThree'},
          'cccPassesRating': {'function': 'multiply', 'params': 5, 'percent': 1, 'per_mode': '_minute',
                              'key': 'cccPasses'},
          'goalsRating': {'function': 'multiply', 'params': 15, 'percent': 1, 'per_mode': '_minute', 'key': 'goals'},
          'errorsRating': {'function': 'minus_multiply', 'params': 30, 'percent': 0.15, 'per_mode': '_minute',
                           'key': 'totalErrors'},
          'dribbledPastRating': {'function': 'minus_multiply', 'params': 8, 'percent': 0.1, 'per_mode': '_minute',
                                 'key': 'dribbledPast'},
          'shotsAccuracyRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                  'key': 'shotsAccuracy'},
          'dribbleSuccessRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                   'key': 'dribbleSuccess'},
          'totalSavesRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'totalSaves'},
          'collectedRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                              'key': 'totalCollected'},
          'parriedDangerRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'totalParried'},
          'goalsConcededRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'goalsConceded'}},
      'GK': {
          'passesAccuracyRating': {'function': 'normdist', 'params': [0.67, 0.22], 'percent': 0.1, 'per_mode': 'match',
                                   'key': 'passesAccuracy'},
          'totalSavesRating': {'function': 'normdist', 'params': [3, 1.29], 'percent': 0.25, 'per_mode': '_minute',
                               'key': 'totalSaves'},
          'collectedRating': {'function': 'normdist', 'params': [1, 1.29], 'percent': 0.15, 'per_mode': '_minute',
                              'key': 'totalCollected'},
          'parriedDangerRating': {'function': 'normdist', 'params': [0.1, 0.3], 'percent': 0.15, 'per_mode': '_minute',
                                  'key': 'totalParried'},
          'goalsConcededRating': {'function': 'minus_multiply', 'params': 10, 'percent': 0.2, 'per_mode': '_minute',
                                  'key': 'goalsConceded'},
          'errorsRating': {'function': 'minus_multiply', 'params': 25, 'percent': 0.15, 'per_mode': '_minute',
                           'key': 'totalErrors'},
          'shotsAccuracyRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                  'key': 'shotsAccuracy'},
          'aerialSuccessRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                  'key': 'aerialSuccess'},
          'dribbleSuccessRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                   'key': 'dribbleSuccess'},
          'defenseThreeRatting': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'defenseThree'},
          'cccPassesRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'cccPasses'},
          'goalsRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'goals'},
          'dribbledPastRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                 'key': 'dribbledPast'}},
      'Sub': {
          'shotsAccuracyRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                  'key': 'shotsAccuracy'},
          'aerialSuccessRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                  'key': 'aerialSuccess'},
          'dribbleSuccessRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                   'key': 'dribbleSuccess'},
          'passesAccuracyRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': 'match',
                                   'key': 'passesAccuracy'},
          'defenseThreeRatting': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'defenseThree'},
          'cccPassesRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'cccPasses'},
          'goalsRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'goals'},
          'errorsRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'totalErrors'},
          'dribbledPastRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                 'key': 'dribbledPast'},
          'totalSavesRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute', 'key': 'totalSaves'},
          'collectedRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                              'key': 'totalCollected'},
          'parriedDangerRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'totalParried'},
          'goalsConcededRating': {'function': 'zero', 'params': 0, 'percent': 0, 'per_mode': '_minute',
                                  'key': 'goalsConceded'}}
  }.with_indifferent_access.freeze

  attr_accessor :data
  attr_accessor :config

  def initialize
    @config = DEFAULT_CONFIG
    super
  end

  def config=(new_config)
    new_config.values.each do |value|
      value.values.each do |function_hash|
        params = function_hash['params'].split(' ')
        function_hash['params'] = params.size > 1 ? params : params.first
      end
    end
    @config = new_config
  end

  def save!
    uri = URI.parse('http://localhost:8080/calculator?api_key=' + Rails.application.secrets.rating_password)

    header = {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = config.to_json
    puts config.to_json
    response = http.request(request)

    self.data = response.body if response.code == '200'
  end
end