class SettingsController < ApplicationController
  expose :resource, -> { current_user }
end
