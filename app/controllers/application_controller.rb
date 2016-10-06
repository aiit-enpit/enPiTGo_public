class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  # ログインのチェック
  before_action :logged_in?

  def make_slack_message(log)
    level = ''
    case log.level
    when 1 then
      level = ':confused:'
    when 2 then
      level = ':cry:'
    when 3 then
      level = ':sob:'
    else
      level = ':cry:'
    end
    msg = 'Help:mega:' + level + log.team.name + ':speech_balloon:' + log.message.subscription
    if !log.mentor.nil?
      msg += ':information_desk_person:' + log.mentor.name
    end
    return msg
  end
end
