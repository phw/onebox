module Onebox
  module Engine
    class GoogleCalendarOnebox
      include Engine

      matches_regexp /^(https?:)?\/\/(www\.google\.[\w.]{2,}|goo\.gl)\/calendar\/.+$/
      always_https

      def to_html
        url = @url.split('&').first
        "<iframe src='#{url}&rm=minimal' style='border: 0' width='800' height='600' frameborder='0' scrolling='no'>#{placeholder_html}</iframe>"
      end

      def placeholder_html
        <<HTML
<div placeholder><div class='gdocs-onebox gdocs-onebox-splash' style='display:table-cell;vertical-align:middle;width:800px;height:600px'>
<div style='text-align:center;'>
<div class='gdocs-onebox-logo g-calendar-logo'></div>
<p>Google Calendar</p>
</div></div></div>
HTML
      end
    end
  end
end