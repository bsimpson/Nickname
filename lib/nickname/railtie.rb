module Nicknames
  class Railtie < Rails::Railtie
    rake_tasks do
      load "nickname/tasks.rb"
    end
  end
end
