# Code generated by Microsoft (R) AutoRest Code Generator 0.11.0.0
# Changes may cause incorrect behavior and will be lost if the code is


module Azure::ARM::Resources
  module Models
    #
    # Resource provider operation's display properties.
    #
    class ResourceProviderOperationDisplayProperties
      # @return [String] Gets or sets operation description.
      attr_accessor :publisher

      # @return [String] Gets or sets operation provider.
      attr_accessor :provider

      # @return [String] Gets or sets operation resource.
      attr_accessor :resource

      # @return [String] Gets or sets operation.
      attr_accessor :operation

      # @return [String] Gets or sets operation description.
      attr_accessor :description

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

        serialized_property = object.publisher
        output_object['publisher'] = serialized_property unless serialized_property.nil?

        serialized_property = object.provider
        output_object['provider'] = serialized_property unless serialized_property.nil?

        serialized_property = object.resource
        output_object['resource'] = serialized_property unless serialized_property.nil?

        serialized_property = object.operation
        output_object['operation'] = serialized_property unless serialized_property.nil?

        serialized_property = object.description
        output_object['description'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [ResourceProviderOperationDisplayProperties] Deserialized
      # object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = ResourceProviderOperationDisplayProperties.new

        deserialized_property = object['publisher']
        output_object.publisher = deserialized_property

        deserialized_property = object['provider']
        output_object.provider = deserialized_property

        deserialized_property = object['resource']
        output_object.resource = deserialized_property

        deserialized_property = object['operation']
        output_object.operation = deserialized_property

        deserialized_property = object['description']
        output_object.description = deserialized_property

        output_object.validate

        output_object
      end
    end
  end
end
