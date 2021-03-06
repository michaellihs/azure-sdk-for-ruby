# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::DataFactory::Mgmt::V2018_06_01
  module Models
    #
    # SSIS package location.
    #
    class SSISPackageLocation

      include MsRestAzure

      # @return The SSIS package path. Type: string (or Expression with
      # resultType string).
      attr_accessor :package_path


      #
      # Mapper for SSISPackageLocation class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'SSISPackageLocation',
          type: {
            name: 'Composite',
            class_name: 'SSISPackageLocation',
            model_properties: {
              package_path: {
                client_side_validation: true,
                required: true,
                serialized_name: 'packagePath',
                type: {
                  name: 'Object'
                }
              }
            }
          }
        }
      end
    end
  end
end
