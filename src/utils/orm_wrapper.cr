module Frost::OrmWrapper
  def all : Array(self)
    self.select
  end

  def get(id : Int32) : self
    self.find(id)
  end
end
