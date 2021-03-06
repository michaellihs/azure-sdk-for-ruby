# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ServiceFabric::V6_4_0_36
  module Models
    #
    # Information about the identity, status, health, node name, uptime, and
    # other details about the replica.
    #
    class ReplicaInfo

      include MsRestAzure

      @@discriminatorMap = Hash.new
      @@discriminatorMap["Stateful"] = "StatefulServiceReplicaInfo"
      @@discriminatorMap["Stateless"] = "StatelessServiceInstanceInfo"

      def initialize
        @ServiceKind = "ReplicaInfo"
      end

      attr_accessor :ServiceKind

      # @return [ReplicaStatus] The status of a replica of a service. Possible
      # values include: 'Invalid', 'InBuild', 'Standby', 'Ready', 'Down',
      # 'Dropped'
      attr_accessor :replica_status

      # @return [HealthState] The health state of a Service Fabric entity such
      # as Cluster, Node, Application, Service, Partition, Replica etc.
      # Possible values include: 'Invalid', 'Ok', 'Warning', 'Error', 'Unknown'
      attr_accessor :health_state

      # @return [String] The name of a Service Fabric node.
      attr_accessor :node_name

      # @return [String] The address the replica is listening on.
      attr_accessor :address

      # @return [String] The last in build duration of the replica in seconds.
      attr_accessor :last_in_build_duration_in_seconds


      #
      # Mapper for ReplicaInfo class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ReplicaInfo',
          type: {
            name: 'Composite',
            polymorphic_discriminator: 'ServiceKind',
            uber_parent: 'ReplicaInfo',
            class_name: 'ReplicaInfo',
            model_properties: {
              replica_status: {
                client_side_validation: true,
                required: false,
                serialized_name: 'ReplicaStatus',
                type: {
                  name: 'String'
                }
              },
              health_state: {
                client_side_validation: true,
                required: false,
                serialized_name: 'HealthState',
                type: {
                  name: 'String'
                }
              },
              node_name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'NodeName',
                type: {
                  name: 'String'
                }
              },
              address: {
                client_side_validation: true,
                required: false,
                serialized_name: 'Address',
                type: {
                  name: 'String'
                }
              },
              last_in_build_duration_in_seconds: {
                client_side_validation: true,
                required: false,
                serialized_name: 'LastInBuildDurationInSeconds',
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
