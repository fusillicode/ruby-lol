require 'lol/model'

module Lol
  class Game < Lol::Model
    # @!attribute [r] id
    # @return [Fixnum] Game Id
    attr_reader :game_id

    # @!attribute [r] champion_id
    # @return [Fixnum] Champion Id associated with this game
    attr_reader :champion_id

    # @!attribute [r] create_date
    # @return [Time] Date game was played
    attr_reader :create_date

    # @!attribute [r] create_date_str
    # @return [String] Human readable string representing date game was played
    attr_reader :create_date_str

    # @!attribute [r] fellow_players
    # @return [Array] list of players associated with this game
    attr_reader :fellow_players

    # @!attribute [r] game_mode
    # @return [String] Game Mode
    attr_reader :game_mode

    # @!attribute [r] game_type
    # @return [String] Game Type
    attr_reader :game_type

    # @!attribute [r] invalid
    # @return [true] if the game is invalid
    # @return [false] if the game is valid
    attr_reader :invalid

    # @!attribute [r] level
    # @return [Fixnum] Level
    attr_reader :level

    # @!attribute [r] map_id
    # @return [Fixnum] Map Id
    attr_reader :map_id

    # @!attribute [r] spell1
    # @return [Fixnum] Summoner first spell id
    attr_reader :spell1

    # @!attribute [r] spell2
    # @return [Fixnum] Summoner second spell id
    attr_reader :spell2

    # @!attribute [r] statistics
    # @return [Array] Statistics associated with the game for this summoner
    attr_reader :statistics

    # @!attribute [r] sub_type
    # @return [String] Game sub-type
    attr_reader :sub_type

    # @!attribute [r] team_id
    # @return [Fixnum] Team Id associated with game
    attr_reader :team_id

    private

    attr_writer :champion_id, :game_id, :game_mode, :game_type, :invalid,
                :level, :map_id, :spell1, :spell2, :sub_type, :team_id,
                :create_date_str

    def create_date= value
      @create_date = value.is_a?(Numeric) && Time.at(value / 1000) || value
    end

    def fellow_players= collection
      @fellow_players = collection.map do |c|
        c.respond_to?(:[]) && Player.new(c) || c
      end
    end

    def statistics= collection
      @statistics = collection.map do |c|
        c.respond_to?(:[]) && RawStatistic.new(c) || c
      end
    end
  end
end
