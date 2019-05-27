class Example

  def str
    <<-SQL
      sasdfasdf
      adsafsdf
      ssdfghs
      dfasdfa
      dfasdf
a      asdfasdfasdfasdfsh
    SQL
  end

  def sql1
    <<-SQL
      select * from users where user.id > 100
    SQL
  end

  def sql2
    "
      SELECT * 
      from users 
      where user.id > 100
      JOIN profiles ON profiles.user_id =users.id
    "
  end

  def sql3
    "
    SELECT * 
    from users 
    where user.id > 100
    JOIN profiles ON profiles.user_id =users.id
    GROUP BY gender
    HAVING 100 > Max(#{hogeo})
    "
  end

  def hogeo
    'test'
  end
end