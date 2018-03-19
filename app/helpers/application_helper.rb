module ApplicationHelper

	def admin
		@current_user.try(:type) == 'Admin'
	end

	def countdown(time_until = Time.new(2016), id: '')
		byebug
    seconds_diff = (time_until - Time.now).to_i

    days = seconds_diff / 86400
    seconds_diff -= days * 86400

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff

    time = "<span class='timepiece-days'>#{days.to_s}</span>"\
           "<span class='timepiece-separator tp-separator-days-hours'>:</span>"\
           "<span class='timepiece-hours'>#{"%02d" % hours}</span>"\
           "<span class='timepiece-separator tp-separator-hours-minutes'>:</span>"\
           "<span class='timepiece-minutes'>#{"%02d" % minutes}</span>"\
           "<span class='timepiece-separator tp-separator-minutes-seconds'>:</span>"\
           "<span class='timepiece-seconds'>#{"%02d" % seconds}</span>"
           # "<span class='timepiece-seconds'>#{seconds.to_s.rjust(2, '0')}</span>" # Note: rjust; it might be useful.

    content_tag(:span, time.html_safe, class: 'timepiece-countdown', 'data-days' => days, 'data-hours' => hours, 'data-minutes' => minutes, 'data-seconds' => seconds, 'id' => (id unless id.blank?))
  end
	
end
