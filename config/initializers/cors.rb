Rails.application.config.middleware.insert_before 0, Rack::Cors do 
    allow do
        origins 'http://www.travelsaver.io/'
        resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end
end