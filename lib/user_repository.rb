# frozen_string_literal: true

class UserRepository
  def create
    @db = SQLite3::Database.new('sns.db')
    sql = 'CREATE TABLE USERS(id string, name string)'
    @db.execute(sql)
  end

  def insert(user)
    sql = 'INSERT INTO USERS(id, name) VALUES(:id, :name)'
    @db.execute(sql, id: user.id.value, name: user.name.value)
  end

  def destroy
    sql = 'DROP TABLE USERS'
    @db.execute(sql)
    @db.close
  end
end
