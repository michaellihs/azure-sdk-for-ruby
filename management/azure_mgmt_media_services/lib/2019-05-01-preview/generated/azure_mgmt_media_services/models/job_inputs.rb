# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2019_05_01_preview
  module Models
    #
    # Describes a list of inputs to a Job.
    #
    class JobInputs < JobInput

      include MsRestAzure


      def initialize
        @odatatype = "#Microsoft.Media.JobInputs"
      end

      attr_accessor :odatatype

      # @return [Array<JobInput>] List of inputs to a Job.
      attr_accessor :inputs


      #
      # Mapper for JobInputs class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: '#Microsoft.Media.JobInputs',
          type: {
            name: 'Composite',
            class_name: 'JobInputs',
            model_properties: {
              odatatype: {
                client_side_validation: true,
                required: true,
                serialized_name: '@odata\\.type',
                type: {
                  name: 'String'
                }
              },
              inputs: {
                client_side_validation: true,
                required: false,
                serialized_name: 'inputs',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'JobInputElementType',
                      type: {
                        name: 'Composite',
                        polymorphic_discriminator: '@odata.type',
                        uber_parent: 'JobInput',
                        class_name: 'JobInput'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end
