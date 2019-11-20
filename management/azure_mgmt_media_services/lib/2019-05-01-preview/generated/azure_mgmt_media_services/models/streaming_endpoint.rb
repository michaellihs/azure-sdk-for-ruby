# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2019_05_01_preview
  module Models
    #
    # The StreamingEndpoint.
    #
    class StreamingEndpoint < TrackedResource

      include MsRestAzure

      # @return [String] The StreamingEndpoint description.
      attr_accessor :description

      # @return [Integer] The number of scale units.  Use the Scale operation
      # to adjust this value.
      attr_accessor :scale_units

      # @return [String] The name of the AvailabilitySet used with this
      # StreamingEndpoint for high availability streaming.  This value can only
      # be set at creation time.
      attr_accessor :availability_set_name

      # @return [StreamingEndpointAccessControl] The access control definition
      # of the StreamingEndpoint.
      attr_accessor :access_control

      # @return [Integer] Max cache age
      attr_accessor :max_cache_age

      # @return [Array<String>] The custom host names of the StreamingEndpoint
      attr_accessor :custom_host_names

      # @return [String] The StreamingEndpoint host name.
      attr_accessor :host_name

      # @return [Boolean] The CDN enabled flag.
      attr_accessor :cdn_enabled

      # @return [String] The CDN provider name.
      attr_accessor :cdn_provider

      # @return [String] The CDN profile name.
      attr_accessor :cdn_profile

      # @return [String] The provisioning state of the StreamingEndpoint.
      attr_accessor :provisioning_state

      # @return [StreamingEndpointResourceState] The resource state of the
      # StreamingEndpoint. Possible values include: 'Stopped', 'Starting',
      # 'Running', 'Stopping', 'Deleting', 'Scaling'
      attr_accessor :resource_state

      # @return [CrossSiteAccessPolicies] The StreamingEndpoint access
      # policies.
      attr_accessor :cross_site_access_policies

      # @return [DateTime] The free trial expiration time.
      attr_accessor :free_trial_end_time

      # @return [DateTime] The exact time the StreamingEndpoint was created.
      attr_accessor :created

      # @return [DateTime] The exact time the StreamingEndpoint was last
      # modified.
      attr_accessor :last_modified


      #
      # Mapper for StreamingEndpoint class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'StreamingEndpoint',
          type: {
            name: 'Composite',
            class_name: 'StreamingEndpoint',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                read_only: true,
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
              location: {
                client_side_validation: true,
                required: false,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              description: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.description',
                type: {
                  name: 'String'
                }
              },
              scale_units: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.scaleUnits',
                type: {
                  name: 'Number'
                }
              },
              availability_set_name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.availabilitySetName',
                type: {
                  name: 'String'
                }
              },
              access_control: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.accessControl',
                type: {
                  name: 'Composite',
                  class_name: 'StreamingEndpointAccessControl'
                }
              },
              max_cache_age: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.maxCacheAge',
                type: {
                  name: 'Number'
                }
              },
              custom_host_names: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.customHostNames',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              host_name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.hostName',
                type: {
                  name: 'String'
                }
              },
              cdn_enabled: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.cdnEnabled',
                type: {
                  name: 'Boolean'
                }
              },
              cdn_provider: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.cdnProvider',
                type: {
                  name: 'String'
                }
              },
              cdn_profile: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.cdnProfile',
                type: {
                  name: 'String'
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              resource_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.resourceState',
                type: {
                  name: 'String'
                }
              },
              cross_site_access_policies: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.crossSiteAccessPolicies',
                type: {
                  name: 'Composite',
                  class_name: 'CrossSiteAccessPolicies'
                }
              },
              free_trial_end_time: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.freeTrialEndTime',
                type: {
                  name: 'DateTime'
                }
              },
              created: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.created',
                type: {
                  name: 'DateTime'
                }
              },
              last_modified: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.lastModified',
                type: {
                  name: 'DateTime'
                }
              }
            }
          }
        }
      end
    end
  end
end
