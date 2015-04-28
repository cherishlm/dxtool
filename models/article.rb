class Article < ActiveRecord::Base 
  default_scope {order('id Desc')}
end
