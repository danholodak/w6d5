require 'action_view'

# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
	include ActionView::Helpers::DateHelper
	
	CAT_COLORS = ["brown", "grey", "black", "orange", "amber", "white"].freeze

	validates :birth_date, :name, :color, :sex, presence: true 
	validates :color, inclusion: {in: CAT_COLORS, message: "Not a valid color"}
	validates :sex, inclusion: {in: ["M", "F"], message: "We don't respect non-gender pronouns!"}
	validate :birth_date_cannot_be_future

	def birth_date_cannot_be_future
		today = Date.today#parse(Time.now.to_s.split[0])
		birthdate_compare = birth_date <=> today
		unless [0,-1].include?(birthdate_compare)
			#sad
			errors.add(:birth_date, "Cat not born yet!!")
		end
	end

	def age
		time_ago_in_words(birth_date.to_time)
	end

	def cat_colors
		CAT_COLORS
	end
end
