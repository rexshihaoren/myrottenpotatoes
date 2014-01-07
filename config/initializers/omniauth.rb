Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["I3xEKUzXV9gSMQvliMxFaA"], ENV["8mNaWEgbZ40VkiI0sNdOOd9R8waIYBG3II8eAf4PYg"]
end