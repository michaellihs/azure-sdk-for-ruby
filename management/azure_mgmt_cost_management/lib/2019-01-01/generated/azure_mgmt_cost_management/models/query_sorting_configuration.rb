# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::CostManagement::Mgmt::V2019_01_01
  module Models
    #
    # The configuration for sorting in the query.
    #
    class QuerySortingConfiguration

      include MsRestAzure

      # @return [SortDirection] The sorting direction. Possible values include:
      # 'Ascending', 'Descending'
      attr_accessor :query_sorting_direction

      # @return [String] The name of the column to use in sorting.
      attr_accessor :name


      #
      # Mapper for QuerySortingConfiguration class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'QuerySortingConfiguration',
          type: {
            name: 'Composite',
            class_name: 'QuerySortingConfiguration',
            model_properties: {
              query_sorting_direction: {
                client_side_validation: true,
                required: false,
                serialized_name: 'querySortingDirection',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
