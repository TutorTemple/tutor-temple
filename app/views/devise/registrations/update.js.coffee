<% unless resource.errors.blank? %>
$('#account').html("<%= j(render 'settings/account_settings_form', resource: resource) %>")
<% end %>
