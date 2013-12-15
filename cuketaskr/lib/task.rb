class Task
  attr_accessor :attributes
  def initialize(attrs)
    @attributes=attrs
  end
  def self.table
    Database.instance.db[:tasks]
  end
  def table
    self.class.table
  end
  def self.create(attributes)
    table << attributes
    Task.new(table.reverse_order(:id).limit(1).first)
  end
  def self.all
    table.to_a
  end
  def complete!
    update(:status=>"completed")
  end
  def self.where(attributes)
    table.where(attributes).collect {|t| Task.new(t)}
  end
  def update(attributes)
    table.where(:id=>@attributes[:id]).update(attributes)
    Task.new(table.where(:id=>@attributes[:id]).first)
  end
  def title
    @attributes[:title]
  end
  def status
    @attributes[:status]
  end
end
