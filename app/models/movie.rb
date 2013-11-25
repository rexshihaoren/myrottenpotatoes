class Movie < ActiveRecord::Base
	def self.all_ratings
    	%w(G PG PG-13 NC-17 R)
  	end
  	validates :title, :presence => true
  	validates :release_date, :presence =>true
  	validate :released_1930_or_later # validate other than validates for customed validations
  	validates :rating, :inclusion => {:in => Movie.all_ratings},
  		:unless => :grandfathered?
  	def released_1930_or_later
  		errors.add(:release_date , 'must be 1930 or later') if
  			self.release_date < Date.parse('1 Jan 1930')
  	end
  	@@grandfathered_date = Date.parse('1 Nov 1968')
  	def grandfathered? ; self.release_date >= @@grandfathered_date ; end
end