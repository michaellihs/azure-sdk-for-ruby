# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::DevTestLabs::Mgmt::V2018_09_15
  #
  # A service client - single point of access to the REST API.
  #
  class DevTestLabsClient < MsRestAzure::AzureServiceClient
    include MsRestAzure
    include MsRestAzure::Serialization

    # @return [String] the base URI of the service.
    attr_accessor :base_url

    # @return Credentials needed for the client to connect to Azure.
    attr_reader :credentials

    # @return [String] Client API version.
    attr_reader :api_version

    # @return [String] The subscription ID.
    attr_accessor :subscription_id

    # @return [String] The preferred language for the response.
    attr_accessor :accept_language

    # @return [Integer] The retry timeout in seconds for Long Running
    # Operations. Default value is 30.
    attr_accessor :long_running_operation_retry_timeout

    # @return [Boolean] Whether a unique x-ms-client-request-id should be
    # generated. When set to true a unique x-ms-client-request-id value is
    # generated and included in each request. Default is true.
    attr_accessor :generate_client_request_id

    # @return [ProviderOperations] provider_operations
    attr_reader :provider_operations

    # @return [Labs] labs
    attr_reader :labs

    # @return [Operations] operations
    attr_reader :operations

    # @return [GlobalSchedules] global_schedules
    attr_reader :global_schedules

    # @return [ArtifactSources] artifact_sources
    attr_reader :artifact_sources

    # @return [ArmTemplates] arm_templates
    attr_reader :arm_templates

    # @return [Artifacts] artifacts
    attr_reader :artifacts

    # @return [Costs] costs
    attr_reader :costs

    # @return [CustomImages] custom_images
    attr_reader :custom_images

    # @return [Formulas] formulas
    attr_reader :formulas

    # @return [GalleryImages] gallery_images
    attr_reader :gallery_images

    # @return [NotificationChannels] notification_channels
    attr_reader :notification_channels

    # @return [PolicySets] policy_sets
    attr_reader :policy_sets

    # @return [Policies] policies
    attr_reader :policies

    # @return [Schedules] schedules
    attr_reader :schedules

    # @return [ServiceRunners] service_runners
    attr_reader :service_runners

    # @return [Users] users
    attr_reader :users

    # @return [Disks] disks
    attr_reader :disks

    # @return [Environments] environments
    attr_reader :environments

    # @return [Secrets] secrets
    attr_reader :secrets

    # @return [ServiceFabrics] service_fabrics
    attr_reader :service_fabrics

    # @return [ServiceFabricSchedules] service_fabric_schedules
    attr_reader :service_fabric_schedules

    # @return [VirtualMachines] virtual_machines
    attr_reader :virtual_machines

    # @return [VirtualMachineSchedules] virtual_machine_schedules
    attr_reader :virtual_machine_schedules

    # @return [VirtualNetworks] virtual_networks
    attr_reader :virtual_networks

    #
    # Creates initializes a new instance of the DevTestLabsClient class.
    # @param credentials [MsRest::ServiceClientCredentials] credentials to authorize HTTP requests made by the service client.
    # @param base_url [String] the base URI of the service.
    # @param options [Array] filters to be applied to the HTTP requests.
    #
    def initialize(credentials = nil, base_url = nil, options = nil)
      super(credentials, options)
      @base_url = base_url || 'https://management.azure.com'

      fail ArgumentError, 'invalid type of credentials input parameter' unless credentials.is_a?(MsRest::ServiceClientCredentials) unless credentials.nil?
      @credentials = credentials

      @provider_operations = ProviderOperations.new(self)
      @labs = Labs.new(self)
      @operations = Operations.new(self)
      @global_schedules = GlobalSchedules.new(self)
      @artifact_sources = ArtifactSources.new(self)
      @arm_templates = ArmTemplates.new(self)
      @artifacts = Artifacts.new(self)
      @costs = Costs.new(self)
      @custom_images = CustomImages.new(self)
      @formulas = Formulas.new(self)
      @gallery_images = GalleryImages.new(self)
      @notification_channels = NotificationChannels.new(self)
      @policy_sets = PolicySets.new(self)
      @policies = Policies.new(self)
      @schedules = Schedules.new(self)
      @service_runners = ServiceRunners.new(self)
      @users = Users.new(self)
      @disks = Disks.new(self)
      @environments = Environments.new(self)
      @secrets = Secrets.new(self)
      @service_fabrics = ServiceFabrics.new(self)
      @service_fabric_schedules = ServiceFabricSchedules.new(self)
      @virtual_machines = VirtualMachines.new(self)
      @virtual_machine_schedules = VirtualMachineSchedules.new(self)
      @virtual_networks = VirtualNetworks.new(self)
      @api_version = '2018-09-15'
      @accept_language = 'en-US'
      @long_running_operation_retry_timeout = 30
      @generate_client_request_id = true
      add_telemetry
    end

    #
    # Makes a request and returns the body of the response.
    # @param method [Symbol] with any of the following values :get, :put, :post, :patch, :delete.
    # @param path [String] the path, relative to {base_url}.
    # @param options [Hash{String=>String}] specifying any request options like :body.
    # @return [Hash{String=>String}] containing the body of the response.
    # Example:
    #
    #  request_content = "{'location':'westus','tags':{'tag1':'val1','tag2':'val2'}}"
    #  path = "/path"
    #  options = {
    #    body: request_content,
    #    query_params: {'api-version' => '2016-02-01'}
    #  }
    #  result = @client.make_request(:put, path, options)
    #
    def make_request(method, path, options = {})
      result = make_request_with_http_info(method, path, options)
      result.body unless result.nil?
    end

    #
    # Makes a request and returns the operation response.
    # @param method [Symbol] with any of the following values :get, :put, :post, :patch, :delete.
    # @param path [String] the path, relative to {base_url}.
    # @param options [Hash{String=>String}] specifying any request options like :body.
    # @return [MsRestAzure::AzureOperationResponse] Operation response containing the request, response and status.
    #
    def make_request_with_http_info(method, path, options = {})
      result = make_request_async(method, path, options).value!
      result.body = result.response.body.to_s.empty? ? nil : JSON.load(result.response.body)
      result
    end

    #
    # Makes a request asynchronously.
    # @param method [Symbol] with any of the following values :get, :put, :post, :patch, :delete.
    # @param path [String] the path, relative to {base_url}.
    # @param options [Hash{String=>String}] specifying any request options like :body.
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def make_request_async(method, path, options = {})
      fail ArgumentError, 'method is nil' if method.nil?
      fail ArgumentError, 'path is nil' if path.nil?

      request_url = options[:base_url] || @base_url
      if(!options[:headers].nil? && !options[:headers]['Content-Type'].nil?)
        @request_headers['Content-Type'] = options[:headers]['Content-Type']
      end

      request_headers = @request_headers
      request_headers.merge!({'accept-language' => @accept_language}) unless @accept_language.nil?
      options.merge!({headers: request_headers.merge(options[:headers] || {})})
      options.merge!({credentials: @credentials}) unless @credentials.nil?

      super(request_url, method, path, options)
    end


    private
    #
    # Adds telemetry information.
    #
    def add_telemetry
        sdk_information = 'azure_mgmt_devtestlabs'
        sdk_information = "#{sdk_information}/0.18.0"
        add_user_agent_information(sdk_information)
    end
  end
end
