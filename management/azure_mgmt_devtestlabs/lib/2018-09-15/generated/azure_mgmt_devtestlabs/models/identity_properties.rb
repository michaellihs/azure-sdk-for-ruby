# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::DevTestLabs::Mgmt::V2018_09_15
  module Models
    #
    # Properties of a managed identity
    #
    class IdentityProperties

      include MsRestAzure

      # @return [String] Managed identity.
      attr_accessor :type

      # @return [String] The principal id of resource identity.
      attr_accessor :principal_id

      # @return [String] The tenant identifier of resource.
      attr_accessor :tenant_id

      # @return [String] The client secret URL of the identity.
      attr_accessor :client_secret_url


      #
      # Mapper for IdentityProperties class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'IdentityProperties',
          type: {
            name: 'Composite',
            class_name: 'IdentityProperties',
            model_properties: {
              type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              principal_id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'principalId',
                type: {
                  name: 'String'
                }
              },
              tenant_id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tenantId',
                type: {
                  name: 'String'
                }
              },
              client_secret_url: {
                client_side_validation: true,
                required: false,
                serialized_name: 'clientSecretUrl',
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
