module FlashNotificationHelper
  def flash_notification
    flash_messages = []

    flash.each do |type, message|
      next unless message
      notification = content_tag(:div, message, class: "toast toast-#{type} p-3 mb-5")
      flash_messages << notification
    end

    safe_join(flash_messages)
  end
end
