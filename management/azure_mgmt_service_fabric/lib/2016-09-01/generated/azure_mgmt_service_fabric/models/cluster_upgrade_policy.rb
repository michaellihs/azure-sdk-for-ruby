# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ServiceFabric::Mgmt::V2016_09_01
  module Models
    #
    # Cluster upgrade policy
    #
    class ClusterUpgradePolicy

      include MsRestAzure

      # @return [Boolean] Use the user defined upgrade policy or not
      attr_accessor :override_user_upgrade_policy

      # @return [Boolean] Force node to restart or not
      attr_accessor :force_restart

      # @return [String] Timeout for replica set upgrade to complete,it
      # represents .Net TimeSpan
      attr_accessor :upgrade_replica_set_check_timeout

      # @return [String] The length of time to wait after completing an upgrade
      # domain before performing health checks, it represents .Net TimeSpan
      attr_accessor :health_check_wait_duration

      # @return [String] The length of time that health checks must pass
      # continuously,it represents .Net TimeSpan
      attr_accessor :health_check_stable_duration

      # @return [String] The length of time that health checks can fail
      # continuously,it represents .Net TimeSpan
      attr_accessor :health_check_retry_timeout

      # @return [String] The upgrade timeout,it represents .Net TimeSpan
      attr_accessor :upgrade_timeout

      # @return [String] The timeout for any upgrade domain,it represents .Net
      # TimeSpan
      attr_accessor :upgrade_domain_timeout

      # @return [ClusterHealthPolicy] Cluster health Policy
      attr_accessor :health_policy

      # @return [ClusterUpgradeDeltaHealthPolicy] Delta health policy
      attr_accessor :delta_health_policy


      #
      # Mapper for ClusterUpgradePolicy class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ClusterUpgradePolicy',
          type: {
            name: 'Composite',
            class_name: 'ClusterUpgradePolicy',
            model_properties: {
              override_user_upgrade_policy: {
                client_side_validation: true,
                required: false,
                serialized_name: 'overrideUserUpgradePolicy',
                type: {
                  name: 'Boolean'
                }
              },
              force_restart: {
                client_side_validation: true,
                required: false,
                serialized_name: 'forceRestart',
                type: {
                  name: 'Boolean'
                }
              },
              upgrade_replica_set_check_timeout: {
                client_side_validation: true,
                required: true,
                serialized_name: 'upgradeReplicaSetCheckTimeout',
                type: {
                  name: 'String'
                }
              },
              health_check_wait_duration: {
                client_side_validation: true,
                required: true,
                serialized_name: 'healthCheckWaitDuration',
                type: {
                  name: 'String'
                }
              },
              health_check_stable_duration: {
                client_side_validation: true,
                required: true,
                serialized_name: 'healthCheckStableDuration',
                type: {
                  name: 'String'
                }
              },
              health_check_retry_timeout: {
                client_side_validation: true,
                required: true,
                serialized_name: 'healthCheckRetryTimeout',
                type: {
                  name: 'String'
                }
              },
              upgrade_timeout: {
                client_side_validation: true,
                required: true,
                serialized_name: 'upgradeTimeout',
                type: {
                  name: 'String'
                }
              },
              upgrade_domain_timeout: {
                client_side_validation: true,
                required: true,
                serialized_name: 'upgradeDomainTimeout',
                type: {
                  name: 'String'
                }
              },
              health_policy: {
                client_side_validation: true,
                required: true,
                serialized_name: 'healthPolicy',
                type: {
                  name: 'Composite',
                  class_name: 'ClusterHealthPolicy'
                }
              },
              delta_health_policy: {
                client_side_validation: true,
                required: false,
                serialized_name: 'deltaHealthPolicy',
                type: {
                  name: 'Composite',
                  class_name: 'ClusterUpgradeDeltaHealthPolicy'
                }
              }
            }
          }
        }
      end
    end
  end
end
