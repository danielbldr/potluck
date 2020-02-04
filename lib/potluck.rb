class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    dishes_by_cat = @dishes.find_all {|dish| dish.category == category}
  end

  def menu
    category_array = (dishes.map {|dish| dish.category}).uniq
    menu_hash = Hash.new
    @dishes.map do |dish|
      if menu_hash.key?(dish.category) == true
        menu_hash[dish.category] << dish.name
      else
        menu_hash[dish.category] = [dish.name]
      end
    end
    menu_hash.transform_keys! {|key| key.to_s + 's'}
    menu_hash.transform_keys!(&:to_sym)
    menu_hash.transform_values!(&:sort)
  end

  def ratio(category)
    ((get_all_from_category(category).length.to_f / dishes.length) * 100).round(1)
  end
end
