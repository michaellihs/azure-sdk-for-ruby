# Code generated by Microsoft (R) AutoRest Code Generator 0.11.0.0
# Changes may cause incorrect behavior and will be lost if the code is


module Azure::ARM::Resources
  module Models
    #
    # Entity representing the reference to the deployment paramaters.
    #
    class ParametersLink
      # @return [String] URI referencing the template.
      attr_accessor :uri

      # @return [String] If included it must match the ContentVersion in the
      # template.
      attr_accessor :content_version

      #
      # Validate the object. Throws ArgumentError if validation fails.
      #
      def validate
        # Nothing to validate
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.uri
        output_object['uri'] = serialized_property unless serialized_property.nil?

        serialized_property = object.content_version
        output_object['contentVersion'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [ParametersLink] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = ParametersLink.new

        deserialized_property = object['uri']
        output_object.uri = deserialized_property

        deserialized_property = object['contentVersion']
        output_object.content_version = deserialized_property

        output_object.validate

        output_object
      end
    end
  end
end
