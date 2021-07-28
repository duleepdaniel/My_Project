class BananaSchema < ActiveRecord::Base
    self.abstract_class = true
    establish_connect :banana_schema
end