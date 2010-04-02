class CreateCompanyInformations < ActiveRecord::Migration
  def self.up
    create_table :company_informations do |t|
      t.text :information

      t.timestamps
    end
  end

  def self.down
    drop_table :company_informations
  end
end
