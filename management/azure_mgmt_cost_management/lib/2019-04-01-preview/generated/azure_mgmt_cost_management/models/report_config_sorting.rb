# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::CostManagement::Mgmt::V2019_04_01_preview
  module Models
    #
    # The order by expression to be used in the report.
    #
    class ReportConfigSorting

      include MsRestAzure

      # @return [Enum] Direction of sort. Possible values include: 'Ascending',
      # 'Descending'
      attr_accessor :direction

      # @return [String] The name of the column to sort.
      attr_accessor :name


      #
      # Mapper for ReportConfigSorting class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ReportConfigSorting',
          type: {
            name: 'Composite',
            class_name: 'ReportConfigSorting',
            model_properties: {
              direction: {
                client_side_validation: true,
                required: false,
                serialized_name: 'direction',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: true,
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
