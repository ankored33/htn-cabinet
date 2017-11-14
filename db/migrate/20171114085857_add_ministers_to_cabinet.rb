class AddMinistersToCabinet < ActiveRecord::Migration[5.1]
  def change
    add_column :cabinets, :sori, :string
    add_column :cabinets, :somu, :string
    add_column :cabinets, :homu, :string
    add_column :cabinets, :gaimu, :string
    add_column :cabinets, :zaimu, :string
    add_column :cabinets, :monbukagaku, :string
    add_column :cabinets, :koseirodo, :string
    add_column :cabinets, :norinsuisan, :string
    add_column :cabinets, :keizaisangyo, :string
    add_column :cabinets, :kokudokotsu, :string
    add_column :cabinets, :kankyo, :string
    add_column :cabinets, :boei, :string
    add_column :cabinets, :kanbo, :string
    add_column :cabinets, :koan, :string
    add_column :cabinets, :tokumei_masuda, :string
  end
end
