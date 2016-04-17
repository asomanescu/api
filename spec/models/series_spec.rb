# == Schema Information
#
# Table name: series
#
#  id          :integer          not null, primary key
#  name        :string
#  rating      :float
#  status      :string
#  first_aired :datetime
#  fan_art     :string
#  overview    :text
#  genre       :string
#  banner      :string
#  imdb_id     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Series, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
