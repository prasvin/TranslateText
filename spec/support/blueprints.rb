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
  requester
  title { "Test Task" }
  text { "aaa\r\n\r\na a a a a a" }
  language_to { 1 }
  language_from { 3 }
  points { 10 }
  deadline { DateTime.now }
end

Microtask.blueprint do
  # Attributes here
end

Language.blueprint do
  name { "Nepali" }
end

LogEntry.blueprint do
  # Attributes here
end
