#
# microphisher - a spear phishing support tool
#
# Created by Ulisses Albuquerque & Joaquim Espinhara
# Copyright (C) 2013 Trustwave Holdings, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

class DataSource
  include Mongoid::Document

  # Relations
  belongs_to :unknown_subject
  has_many :status_updates

  # Attribute listing
  field :user_id, type: String
  field :last_crawl, type: DateTime
  field :status, type: String, default: 'pending'
  field :data_source_metadata, type: Hash, default: Hash.new
  field :profile_image_url, type: String

  def fetch_status_updates!
    raise NotImplementedError.new('This method must be overridden')
  end
end

