class Model
  class << self
    attr_accessor :table
  end
  def self.pluralize(name)
    name.downcase+"s"
  end
  def self.table_name(tname)
    @table=tname
  end
  def self.inherited(klass)
    klass.table=pluralize(klass.name)
  end
end
class Customer < Model
end
class Order < Model
end

class CustomerOrder < Order
  table_name "customer_orders"
end
