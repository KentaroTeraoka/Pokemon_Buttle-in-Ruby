class Pokemon

  def initialize(hp,atk,name)
    @hp=hp
    @atk=atk
    @name=name
  end

end


class GameController

  def initialize(player,enemies)
    @player=player
    @enemies=enemies
  end

  def buttle

    puts "-----Buttle start!!-----"
    sleep(1)

        puts "\nやせいの#{@enemies[0].enemy_name}があらわれた！"
        loop do
          puts "<プレイヤーのこうげき>"
          puts "  #{@player.player_atk}ダメージあたえた！"
          puts "    #{@enemies[0].enemy_name}のたいりょく:#{@enemies[0].enemy_hp-=@player.player_atk}"
          if @enemies[0].enemy_hp<=0
            puts "<#{@enemies[0].enemy_name}をたおした！>"

            puts "\nやせいの#{@enemies[1].enemy_name}があらわれた！"
            loop do
              puts "<プレイヤーのこうげき>"
              puts "  #{@player.player_atk}ダメージくらった！"
              puts "    #{@enemies[1].enemy_name}のたいりょく:#{@enemies[1].enemy_hp-=@player.player_atk}"
              if @enemies[1].enemy_hp<=0
                puts "<#{@enemies[1].enemy_name}をたおした！>"
                break
              end
              puts "<#{@enemies[1].enemy_name}のこうげき>"
              puts "  #{@enemies[1].enemy_atk}ダメージあたえた！"
              puts "    プレイヤーのたいりょく:#{@player.player_hp-=@enemies[1].enemy_atk}"
              sleep(1)
              if @player.player_hp<=0
                puts "<#{@enemies[1].enemy_name}にまけた...>"
                break
              end
            end
            break

          end
          puts "<#{@enemies[0].enemy_name}のこうげき>"
          puts "  #{@enemies[0].enemy_atk}ダメージくらった！"
          puts "    プレイヤーのたいりょく:#{@player.player_hp-=@enemies[0].enemy_atk}"
          sleep(1)
          if @player.player_hp<=0
            puts "<#{@enemies[0].enemy_name}にまけた...>"
            break
          end
        end

    sleep(1)
    puts "\n-----Buttle end-----"

  end

end


class Player<Pokemon
  attr_accessor :player_hp,:player_atk

  def initialize(hp,atk)
    super(hp,atk,name="")
    @player_hp=hp
    @player_atk=atk
  end

end


class Enemy<Pokemon
  attr_accessor :enemy_hp,:enemy_atk,:enemy_name

  def initialize(hp,atk,name)
    super
    @enemy_hp=hp
    @enemy_atk=atk
    @enemy_name=name
  end

end




puts Player.superclass
puts Enemy.superclass

player = Player.new 50, 7
enemy_1 = Enemy.new 10, 1, 'ピチュウ'
enemy_2 = Enemy.new 20, 3, 'ピカチュウ'

gc = GameController.new player, [enemy_1, enemy_2]
gc.buttle


player = Player.new 50, 7
enemy_3 = Enemy.new 100, 10, 'ライチュウ'
enemy_4 = Enemy.new 1, 1, 'コイキング'

gc = GameController.new player, [enemy_3, enemy_4]
gc.buttle
