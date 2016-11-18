def game_hash
  hash = {
    home: {team_name: "Brooklyn Nets", colors: ['Black', 'White'], players: {
      'Alan Anderson' => {number:0, shoe:16, points:22, rebounds:12, assists:12, steals:3, blocks:1, slam_dunks:1},
      'Reggie Evans' => {number:30, shoe:14, points:12, rebounds:12, assists:12, steals:12, blocks:12, slam_dunks:7},
      'Brook Lopez' => {number:11, shoe:17, points:17, rebounds:19, assists:10, steals:3, blocks:1, slam_dunks:15},
      'Mason Plumlee' => {number:1, shoe:19, points:26, rebounds:12, assists:6, steals:3, blocks:8, slam_dunks:5},
      'Jason Terry' => {number:31, shoe:15, points:19, rebounds:2, assists:2, steals:4, blocks:11, slam_dunks:1}
      }},
    away: {team_name: "Charlotte Hornets", colors: ['Turquoise', 'Purple'], players: {
      'Jeff Adrien' => {number:4, shoe:18, points:10, rebounds:1, assists:1, steals:2, blocks:7, slam_dunks:2},
      'Bismak Biyombo' => {number:0, shoe:16, points:12, rebounds:4, assists:7, steals:7, blocks:15, slam_dunks:10},
      'DeSagna Diop' => {number:2, shoe:14, points:24, rebounds:12, assists:12, steals:4, blocks:5, slam_dunks:5},
      'Ben Gordon' => {number:8, shoe:15, points:33, rebounds:3, assists:2, steals:1, blocks:1, slam_dunks:0},
      'Brendan Haywood' => {number:33, shoe:15, points:6, rebounds:12, assists:12, steals:22, blocks:5, slam_dunks:12}
      }}
    }
end

def num_points_scored(players_name)
  game_hash.each do |home_away,rest|
    rest[:players].each do |name,stats|
      if name == players_name
         return stats[:points]
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |home_away, rest|
        rest.each do |team_color_player, rest2|
          if team_color_player == :players
            rest2.each do |name,stats|
              if (name == players_name)
                stats.each do |stat,num|
                  if stat == :shoe
                    return num
                  end
                end
              end
            end
          end
        end
  end
end

def team_colors(team_name)
  game_hash.each do |home_away, rest|
    if rest[:team_name] == team_name
      return (rest[:colors].collect  do |color|
        color
      end)
    end
  end
end

def team_names
  game_hash.collect do |home_away, rest|
    rest[:team_name]
  end
end


def player_numbers(team_name)
  numbers = []
  game_hash.each do |home_away, rest|
    if rest[:team_name] == team_name
      rest[:players].each do |name,stats|
        numbers << stats[:number]
      end
    end
  end
  numbers
end

def player_stats(players_name)
  game_hash.each do |home_away, rest|
        rest.each do |team_color_player, rest2|
          if team_color_player == :players
            rest2.each do |name,stats|
              if name == players_name
                return stats
              end
            end
          end
        end
  end
end



def big_shoe_rebounds
    shoe_size = 0
    answer = 0
    game_hash.each do |home_away, rest|
      rest[:players].each do |name,stats|
        if shoe_size < stats[:shoe]
          shoe_size  = stats[:shoe]
          answer = stats[:rebounds]
        end
      end
     end
    answer
  end
