# Setting up a Mixed API/Web server with Rails and devise-JWT, deployed to heroku

### add Procfile
echo 'web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}' > Procfile

### Add username & password to config/database.yml
```yml
  development:
    username: postgres
    password: postgres
```

### Add secrets to credentials

### Add Devise-JWT to Gemfile and bundle
```Gemfile
  gem 'devise-jwt', '~> 0.5.8'
```

### Add jwt config to devise.rb
```ruby
config.jwt do |jwt|
  jwt.secret = Rails.application.credentials.devise_jwt_secret_key
  jwt.dispatch_requests = [
    ['POST', %r{^/api/v1/users/sign_in$}]
  ]
  jwt.revocation_requests = [
    ['DELETE', %r{^/api/v1/users/sign_out$}]
  ]
  jwt.expiration_time = 1.day.to_i
end
```

### Add secret key to devise
```
$ rake secret
$ EDITOR='subl --wait' bin/rails credentials:edit

devise_jwt_secret_key: paste-secret-here
```
