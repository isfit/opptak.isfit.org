# encoding: utf-8
class Parliament < ActiveRecord::Base
	validates :name, presence: { :message => "må fylles" }, length: { maximum: 255, too_long: "feltet er for langt. %{count} tegn er maks" }	
	validates :email, presence: true, length: { maximum: 255, too_long: "feltet er for langt. %{count} tegn er maks" }
	validates :what_study, :place_of_study, :how_hear_about_day, length: { maximum: 255, too_long: "feltet er for langt. %{count} tegn er maks" }
	validates :why_ip_relevant, :why_attend, length:{ maximum: 10000, too_long: "feltet er for langt. %{count} tegn er maks" }

end
