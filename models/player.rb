require_relative "../db/utils"

class Player

  attr_reader :id, :name, :avatar_url

  def initialize(options)
    @id = options.fetch("id", nil)
    @name = options["name"]
    @avatar_url = options.fetch("avatar_url", nil)
  end

  def insert
    sql = "
    INSERT INTO players
    (name, avatar_url)
    VALUES
    ($1, $2)
    RETURNING *;
    "
    values = [@name, @avatar_url]
    result = execute_query(sql, values).first
    Player.new(result)
  end

end