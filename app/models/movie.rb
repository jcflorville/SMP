class Movie < ActiveRecord::Base
	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	def self.search(q)
  	[:title_esp, :title_eng].inject(scoped) do |combined_scope, attr|
   	 combined_scope.where("movies.#{attr} LIKE ?", "%#{q}%")
   	end
  end
end
