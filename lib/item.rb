class Item

  attr_reader :name, :weight
  @@item_inlucde = []
  @@item_total_weight = 0

  def initialize(name,weight)
    @name = name
    @weight = weight
  end

  def items 
    @@item_inlucde
  end

  def pick_up(pick_item)
    @@item_inlucde << pick_item
  end

  def items_weight
    @@item_inlucde.each do |item|
      @@item_total_weight += item.weight
    end
  end

end