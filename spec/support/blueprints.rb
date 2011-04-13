require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

User.blueprint do
  email { "a@a.com"}
  password { "123456" }
  password_confirmation { "123456" }
  name { "A" }
  points { 0 }
end

Translator.blueprint do
  email { "a@a.com"}
  password { "123456" }
  password_confirmation { "123456" }
  name { "A" }
  points { 0 }
end

Requester.blueprint do
  email { "a@a.com"}
  password { "123456" }
  password_confirmation { "123456" }
  name { "A" }
  points { 1000 }
end

Task.blueprint do
  # Attributes here
end

Microtask.blueprint do
  # Attributes here
end

Language.blueprint do
  # Attributes here
end
