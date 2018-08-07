$(document).on 'turbolinks:load', ->
  return unless self.location.pathname == '/settings'
  self.location.hash = '#account' unless ['#account', '#privacy', '#notifications'].includes(self.location.hash)
