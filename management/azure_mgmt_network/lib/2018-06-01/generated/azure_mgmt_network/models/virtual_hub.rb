# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_06_01
  module Models
    #
    # VirtualHub Resource.
    #
    class VirtualHub < Resource

      include MsRestAzure

      # @return [SubResource] The VirtualWAN to which the VirtualHub belongs
      attr_accessor :virtual_wan

      # @return [Array<HubVirtualNetworkConnection>] list of all vnet
      # connections with this VirtualHub.
      attr_accessor :hub_virtual_network_connections

      # @return [String] Address-prefix for this VirtualHub.
      attr_accessor :address_prefix

      # @return [ProvisioningState] The provisioning state of the resource.
      # Possible values include: 'Succeeded', 'Updating', 'Deleting', 'Failed'
      attr_accessor :provisioning_state

      # @return [String] Gets a unique read-only string that changes whenever
      # the resource is updated.
      attr_accessor :etag


      #
      # Mapper for VirtualHub class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualHub',
          type: {
            name: 'Composite',
            class_name: 'VirtualHub',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              location: {
                client_side_validation: true,
                required: false,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              tags: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              virtual_wan: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.virtualWan',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              hub_virtual_network_connections: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.hubVirtualNetworkConnections',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'HubVirtualNetworkConnectionElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'HubVirtualNetworkConnection'
                      }
                  }
                }
              },
              address_prefix: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.addressPrefix',
                type: {
                  name: 'String'
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              etag: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'etag',
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
