module ApplicationHelper
  def language_norwegian?
    session[:locale].eql? "no"
  end
  def birthday_years?
    @birthday_years = []
      (0..30).each do |i|
        year = i + 1970
        @birthday_years << year
      end
    @birthday_years
  end
end
