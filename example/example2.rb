class Example
  @pokemon = 'pokemon'

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
      where user.id > 100    JOIN profiles ON profiles.user_id =users.id
    "
  end

  def sql3
    "
    SELECT *     from users 
  where user.id > 100
  JOIN profiles ON profiles.user_id =users.id
  GROUP BY gender
    HAVING 100 > Max(#{hogeo})
    AND HAVING 1000 < Max(#{test})
    AND HAVING 1000 < Max(#{String.new})
    AND HAVING 1000 < Max(#{test; test})
    AND HAVING 1000 < Max(#{@pokemon})
    #{!!test ? 'hogeo' : 'hoge'}
    "
  end

  def hogeo
    'test'
    "test"
    'test' + "test"
    'test' << 'test'
  end

  def test
    'hi'
  end

  def single_auot
    'single_quot_str'
  end
end

class Example2
  def hogeo2
    'test'
    "test"
    'test' + "test"
    'test' << 'test'
  end

  def test2
    'hi'
  end
end

class Example
  def str1
    <<-SQL
      SELECT *
      FROM users
      WHERE id > 100
    SQL
  end

  def str2
    "I like gohan. Do you like gohan.Oh Yeah."
  end

  def str3
    "#{hello} Mikel"
  end

  def hello
    'hello world'
  end
end