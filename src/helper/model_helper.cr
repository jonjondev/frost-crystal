module Frost::ModelHelper
  def initialise_tables(models : Array(Topaz::Model.class))
    puts "Initialising tables..."
    tables_existed = 0
    models.each do |model|
      begin
        model.create_table
        puts "#{model} table created"
      rescue
        tables_existed += 1
      end
    end
    created = models.size - tables_existed
    puts "#{created} new #{pluralize("table", created)} created of #{models.size} #{pluralize("model", models.size)}"
  end

  def pluralize(singular : String, value : Int32)
    value == 1 ? singular : singular + 's'
  end
end
