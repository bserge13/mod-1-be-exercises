class Potluck 

  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish 
  end

  def get_all_from_category(hash_category)
    dishes.select do |dish|
      dish.category == hash_category
    end
  end

  def menu 
    app_array = get_all_from_category(:appetizer).map do |dish| 
      dish.name
    end

    entre_array = get_all_from_category(:entre).map do |entre|
      entre.name 
    end

    dessert_array = get_all_from_category(:dessert).map do |dessert|
      dessert.name
    end

    {
      appetizers: app_array.sort,
      entres: entre_array.sort,
      desserts: dessert_array.sort 
    }

    # sorted_dishes = dishes.sort_by { |dish| dish.name }

    # grouped = Hash.new { |grouped, category| grouped[category] = [] }

    # sorted_dishes.each do |dish| 
    #   grouped[dish.category.to_s.insert(-1,"s").to_sym] << dish.name
    # end

    # grouped
  end

  def ratio 
    ((get_all_from_category(category).size.to_f / @dishes.size ) * 100 ).round(1)  
  end
end