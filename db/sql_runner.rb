require 'rubygems'
require 'bundler/setup'

require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'mikes_scuba', host: 'localhost'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
