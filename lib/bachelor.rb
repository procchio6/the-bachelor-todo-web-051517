def get_first_name_of_season_winner(data, season)
  winner = data[season].find { |contestant| contestant["status"] == "Winner" }
  winner["name"].split.first
end

def get_contestant_name(data, occupation)
  contestant_with_occupation = ""
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["occupation"] == occupation
        contestant_with_occupation = contestant["name"]
      end
    end
  end
  contestant_with_occupation
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  occupation = ""
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
        occupation = contestant["occupation"]
        break
      end
    end
  end
  occupation
end

def get_average_age_for_season(data, season)
  ages = []
  data.each do |current_season, contestants|
    if current_season == season
      contestants.each do |contestant|
        ages << contestant["age"].to_f
      end
    end
  end
  average_age = (ages.inject(:+) / ages.count).round
end
