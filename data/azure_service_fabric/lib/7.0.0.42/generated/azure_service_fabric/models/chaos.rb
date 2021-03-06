# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ServiceFabric::V7_0_0_42
  module Models
    #
    # Contains a description of Chaos.
    #
    class Chaos

      include MsRestAzure

      # @return [ChaosParameters] If Chaos is running, these are the parameters
      # Chaos is running with.
      attr_accessor :chaos_parameters

      # @return [ChaosStatus] Current status of the Chaos run. Possible values
      # include: 'Invalid', 'Running', 'Stopped'
      attr_accessor :status

      # @return [ChaosScheduleStatus] Current status of the schedule. Possible
      # values include: 'Invalid', 'Stopped', 'Active', 'Expired', 'Pending'
      attr_accessor :schedule_status


      #
      # Mapper for Chaos class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'Chaos',
          type: {
            name: 'Composite',
            class_name: 'Chaos',
            model_properties: {
              chaos_parameters: {
                client_side_validation: true,
                required: false,
                serialized_name: 'ChaosParameters',
                type: {
                  name: 'Composite',
                  class_name: 'ChaosParameters'
                }
              },
              status: {
                client_side_validation: true,
                required: false,
                serialized_name: 'Status',
                type: {
                  name: 'String'
                }
              },
              schedule_status: {
                client_side_validation: true,
                required: false,
                serialized_name: 'ScheduleStatus',
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
