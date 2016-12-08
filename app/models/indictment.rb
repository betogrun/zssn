class Indictment < ApplicationRecord
  belongs_to :accuser, class_name: 'Survivor'
  belongs_to :indicted, class_name: 'Survivor'
end
