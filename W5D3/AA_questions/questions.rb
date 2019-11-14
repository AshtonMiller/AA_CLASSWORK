require 'sqlite3'
require 'singleton'

class QuestionDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end 

end

class Users
  attr_accessor :f_name, :l_name
  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM users") 
    data.map { |datum| Users.new(datum) }
  end 

  # def self.find_by_name(f_name, l_name)
  #   data = QuestionDBConnection.instance.execute("SELECT * FROM users WHERE ") 
  #   data.map { |datum| Users.new(datum) }
  
  # end 

  def self.find_by_id(id)

  end 

  def initialize(options)
    @id = options["id"]
    @f_name = options["f_name"]
    @l_name = options["l_name"]
  end 

  def create
    raise "#{self} already in database" if @id
    QuestionDBConnection.instance.execute(<<-SQL, @f_name, @l_name)
      INSERT INTO
        users (f_name, l_name)
      VALUES
        (?, ?)
    SQL

  end 

  def update
    raise "#{self} not in database" unless @id
    QuestionDBConnection.instance.execute(<<-SQL, @f_name, @l_name)
      UPDATE
        users
      SET
        f_name = ?, l_name = ?
      WHERE 
        id = ?
    SQL

  end 
end 

class Questions
  attr_accessor :title, :body, :author_id
  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM questions") 
    data.map { |datum| Users.new(datum) }
  end 

  def self.find_by_id(id)

  end 

  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
    @author_id = options["author_id"]

  end 

  def create
    raise "#{self} already in database" if @id
    QuestionDBConnection.instance.execute(<<-SQL, @title, @body, @author_id)
      INSERT INTO
        questions (title, body, author_id)
      VALUES
        (?, ?, ?)
    SQL

  end 

  def update
    raise "#{self} not in database" unless @id
    QuestionDBConnection.instance.execute(<<-SQL, @title, @body, @author_id)
      UPDATE 
        questions
      SET
        title = ?, body = ?, author_id = ?
      WHERE
        id = ?
    SQL
    

  end 
end 

class QuestionsFollows
  attr_accessor :question_id, :user_id
  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM questions_follows") 
    data.map { |datum| Users.new(datum) }
  end 

  def self.find_by_id(id)

  end 

  def initialize(options)
    @id = options["id"]
    @question_id = options["question_id"]
    @user_id = options["user_id"]
  end 

  def create
    raise "#{self} already in database" if @id
    QuestionDBConnection.instance.execute(<<-SQL, @question_id, @user_id)
      INSERT INTO
        questions_follows (question_id, user_id)
      VALUES
        (?, ?)
    SQL


  end 

  def update
    raise "#{self} not in database" unless @id
    QuestionDBConnection.instance.execute(<<-SQL, @question_id, @user_id)
      UPDATE
        questions_follows
      SET
        question_id = ?, user_id = ?
      WHERE
        id = ?
    SQL

  end 
end 



class Replies
  attr_accessor :question_id, :parent_id, :body
  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM replies") 
    data.map { |datum| Users.new(datum) }
  end 

  def self.find_by_id(id)

  end 

  def initialize(options)
    @id = options["id"]
    @question_id = options["question_id"]
    @parent_id = options["parent_id"]
    @body = options["body"]

  end 

  def create
    raise "#{self} already in database" if @id
    QuestionDBConnection.instance.execute(<<-SQL, @question_id, @parent_id, @body)
      INSERT INTO
        replies (question_id, parent_id, body)
      VALUES
        (?, ?, ?)
    SQL


  end 

  def update
    raise "#{self} not in database" unless @id
    QuestionDBConnection.instance.execute(<<-SQL, @question_id, @parent_id, @body)
      UPDATE
        replies 
      SET
        question_id = ?, parent_id = ?, body = ?
      WHERE
        id = ?
    SQL

  end 
end 



class QuestionsLikes
  attr_accessor :question_like_id, :user_like_id
  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM questions_likes") 
    data.map { |datum| Users.new(datum) }
  end 

  def self.find_by_id(id)

  end 

  def initialize(options)
    @id = options["id"]
    @question_like_id = options["question_like_id"]
    @user_like_id = options["user_like_id"]

  end 

  def create
    raise "#{self} already in database" if @id
    QuestionDBConnection.instance.execute(<<-SQL, @question_like_id, @user_like_id)
      INSERT INTO
        questions_likes (question_like_id, user_like_id)
      VALUES
        (?, ?)
    SQL

  end 

  def update
    raise "#{self} not in database" unless @id
    QuestionDBConnection.instance.execute(<<-SQL, @question_like_id, @user_like_id)
      UPDATE
        questions_likes
      SET
        question_like_id = ?, user_like_id = ?
      WHERE
        id = ?
    SQL

  end 
end 