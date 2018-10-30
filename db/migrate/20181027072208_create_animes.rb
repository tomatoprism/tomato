class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
  	create_table :animes do |t|
    # create_table :animes, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :anime_name
      t.string :anime_kana
      t.text :logo_id

      t.timestamps
    end
  end
end
