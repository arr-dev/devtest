namespace :api_key do
  task create: :environment do
    auth = ApiKey.create_with_token!

    puts "token: #{auth.token}"
  end
end
