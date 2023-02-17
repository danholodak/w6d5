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
	validates :birth_date, :name, :color, :sex, presence: true 
	validates :color, inclusion: {in: CAT_COLORS, message: "Not a valid color"}
	validates :sex, inclusion: {in: ["M", "F"], message: "We don't respect non-gender pronouns!"}

	CAT_COLORS = ["brown", "grey", "black", "orange", "amber", "white"]
end