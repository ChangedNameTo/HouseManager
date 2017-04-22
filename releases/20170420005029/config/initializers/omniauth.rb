OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '118001832106-k02hi7guqfk8akjn6k8rmbevf59fb8ma.apps.googleusercontent.com', 'Me4Le_TNDscQDD4cCtdtniep', { client_options: { ssl: { ca_file: Rails.root.join("cacert.pem").to_s } } }

end
