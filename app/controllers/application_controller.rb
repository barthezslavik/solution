class ApplicationController < ActionController::Base
  protect_from_forgery

  def self.simple_action(*actions)
    actions.each {|action| class_eval("def #{action}; end")}
  end

end
