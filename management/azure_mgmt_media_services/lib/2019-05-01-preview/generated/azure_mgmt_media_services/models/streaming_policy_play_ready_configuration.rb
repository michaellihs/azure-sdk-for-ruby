# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2019_05_01_preview
  module Models
    #
    # Class to specify configurations of PlayReady in Streaming Policy
    #
    class StreamingPolicyPlayReadyConfiguration

      include MsRestAzure

      # @return [String] Template for the URL of the custom service delivering
      # licenses to end user players.  Not required when using Azure Media
      # Services for issuing licenses.  The template supports replaceable
      # tokens that the service will update at runtime with the value specific
      # to the request.  The currently supported token values are
      # {AlternativeMediaId}, which is replaced with the value of
      # StreamingLocatorId.AlternativeMediaId, and {ContentKeyId}, which is
      # replaced with the value of identifier of the key being requested.
      attr_accessor :custom_license_acquisition_url_template

      # @return [String] Custom attributes for PlayReady
      attr_accessor :play_ready_custom_attributes


      #
      # Mapper for StreamingPolicyPlayReadyConfiguration class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'StreamingPolicyPlayReadyConfiguration',
          type: {
            name: 'Composite',
            class_name: 'StreamingPolicyPlayReadyConfiguration',
            model_properties: {
              custom_license_acquisition_url_template: {
                client_side_validation: true,
                required: false,
                serialized_name: 'customLicenseAcquisitionUrlTemplate',
                type: {
                  name: 'String'
                }
              },
              play_ready_custom_attributes: {
                client_side_validation: true,
                required: false,
                serialized_name: 'playReadyCustomAttributes',
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
