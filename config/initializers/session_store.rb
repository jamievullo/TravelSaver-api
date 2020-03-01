if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_TravelSaver-api', domain: 'your-frontend-domain'
else
    Rails.application.config.session_store :cookie_store, key: '_TravelSaver-api' 
end