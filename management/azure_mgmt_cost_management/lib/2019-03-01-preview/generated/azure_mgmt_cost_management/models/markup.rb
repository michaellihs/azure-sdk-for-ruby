# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::CostManagement::Mgmt::V2019_03_01_preview
  module Models
    #
    # The Markup model definition
    #
    class Markup

      include MsRestAzure

      # @return [String]
      attr_accessor :percentage


      #
      # Mapper for Markup class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'Markup',
          type: {
            name: 'Composite',
            class_name: 'Markup',
            model_properties: {
              percentage: {
                client_side_validation: true,
                required: false,
                serialized_name: 'percentage',
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
