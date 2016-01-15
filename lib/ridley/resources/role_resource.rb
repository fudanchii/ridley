require 'chef'

module Ridley
  class RoleResource < Ridley::Resource
    set_resource_path "roles"
    represented_by Ridley::RoleObject

    def from_file(filename)
      if filename =~ /\.rb$/
        rrb = ::Chef::Role.new
        rrb.from_file(filename)
        new(rrb.to_hash)
      else
        super
      end
    end
  end
end
