# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2018_07_01
  #
  # LiveOutputs
  #
  class LiveOutputs
    include MsRestAzure

    #
    # Creates and initializes a new instance of the LiveOutputs class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [AzureMediaServices] reference to the AzureMediaServices
    attr_reader :client

    #
    # List Live Outputs
    #
    # Lists the Live Outputs in the Live Event.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Array<LiveOutput>] operation results.
    #
    def list(resource_group_name, account_name, live_event_name, custom_headers:nil)
      first_page = list_as_lazy(resource_group_name, account_name, live_event_name, custom_headers:custom_headers)
      first_page.get_all_items
    end

    #
    # List Live Outputs
    #
    # Lists the Live Outputs in the Live Event.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_with_http_info(resource_group_name, account_name, live_event_name, custom_headers:nil)
      list_async(resource_group_name, account_name, live_event_name, custom_headers:custom_headers).value!
    end

    #
    # List Live Outputs
    #
    # Lists the Live Outputs in the Live Event.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_async(resource_group_name, account_name, live_event_name, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, 'live_event_name is nil' if live_event_name.nil?
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'MaxLength': '32'" if !live_event_name.nil? && live_event_name.length > 32
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'MinLength': '1'" if !live_event_name.nil? && live_event_name.length < 1
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'Pattern': '^[a-zA-Z0-9]+(-*[a-zA-Z0-9])*$'" if !live_event_name.nil? && live_event_name.match(Regexp.new('^^[a-zA-Z0-9]+(-*[a-zA-Z0-9])*$$')).nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Media/mediaservices/{accountName}/liveEvents/{liveEventName}/liveOutputs'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'accountName' => account_name,'liveEventName' => live_event_name},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::MediaServices::Mgmt::V2018_07_01::Models::LiveOutputListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Get Live Output
    #
    # Gets a Live Output.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [LiveOutput] operation results.
    #
    def get(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:nil)
      response = get_async(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Get Live Output
    #
    # Gets a Live Output.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_with_http_info(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:nil)
      get_async(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:custom_headers).value!
    end

    #
    # Get Live Output
    #
    # Gets a Live Output.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, 'live_event_name is nil' if live_event_name.nil?
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'MaxLength': '32'" if !live_event_name.nil? && live_event_name.length > 32
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'MinLength': '1'" if !live_event_name.nil? && live_event_name.length < 1
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'Pattern': '^[a-zA-Z0-9]+(-*[a-zA-Z0-9])*$'" if !live_event_name.nil? && live_event_name.match(Regexp.new('^^[a-zA-Z0-9]+(-*[a-zA-Z0-9])*$$')).nil?
      fail ArgumentError, 'live_output_name is nil' if live_output_name.nil?
      fail ArgumentError, "'live_output_name' should satisfy the constraint - 'MaxLength': '256'" if !live_output_name.nil? && live_output_name.length > 256
      fail ArgumentError, "'live_output_name' should satisfy the constraint - 'MinLength': '1'" if !live_output_name.nil? && live_output_name.length < 1
      fail ArgumentError, "'live_output_name' should satisfy the constraint - 'Pattern': '^([a-zA-Z0-9])+(-*[a-zA-Z0-9])*$'" if !live_output_name.nil? && live_output_name.match(Regexp.new('^^([a-zA-Z0-9])+(-*[a-zA-Z0-9])*$$')).nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Media/mediaservices/{accountName}/liveEvents/{liveEventName}/liveOutputs/{liveOutputName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'accountName' => account_name,'liveEventName' => live_event_name,'liveOutputName' => live_output_name},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 404
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::MediaServices::Mgmt::V2018_07_01::Models::LiveOutput.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Create Live Output
    #
    # Creates a Live Output.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param parameters [LiveOutput] Live Output properties needed for creation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [LiveOutput] operation results.
    #
    def create(resource_group_name, account_name, live_event_name, live_output_name, parameters, custom_headers:nil)
      response = create_async(resource_group_name, account_name, live_event_name, live_output_name, parameters, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param parameters [LiveOutput] Live Output properties needed for creation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Concurrent::Promise] promise which provides async access to http
    # response.
    #
    def create_async(resource_group_name, account_name, live_event_name, live_output_name, parameters, custom_headers:nil)
      # Send request
      promise = begin_create_async(resource_group_name, account_name, live_event_name, live_output_name, parameters, custom_headers:custom_headers)

      promise = promise.then do |response|
        # Defining deserialization method.
        deserialize_method = lambda do |parsed_response|
          result_mapper = Azure::MediaServices::Mgmt::V2018_07_01::Models::LiveOutput.mapper()
          parsed_response = @client.deserialize(result_mapper, parsed_response)
        end

        # Waiting for response.
        @client.get_long_running_operation_result(response, deserialize_method)
      end

      promise
    end

    #
    # Delete Live Output
    #
    # Deletes a Live Output.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    def delete(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:nil)
      response = delete_async(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:custom_headers).value!
      nil
    end

    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Concurrent::Promise] promise which provides async access to http
    # response.
    #
    def delete_async(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:nil)
      # Send request
      promise = begin_delete_async(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:custom_headers)

      promise = promise.then do |response|
        # Defining deserialization method.
        deserialize_method = lambda do |parsed_response|
        end

        # Waiting for response.
        @client.get_long_running_operation_result(response, deserialize_method)
      end

      promise
    end

    #
    # Create Live Output
    #
    # Creates a Live Output.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param parameters [LiveOutput] Live Output properties needed for creation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [LiveOutput] operation results.
    #
    def begin_create(resource_group_name, account_name, live_event_name, live_output_name, parameters, custom_headers:nil)
      response = begin_create_async(resource_group_name, account_name, live_event_name, live_output_name, parameters, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Create Live Output
    #
    # Creates a Live Output.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param parameters [LiveOutput] Live Output properties needed for creation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def begin_create_with_http_info(resource_group_name, account_name, live_event_name, live_output_name, parameters, custom_headers:nil)
      begin_create_async(resource_group_name, account_name, live_event_name, live_output_name, parameters, custom_headers:custom_headers).value!
    end

    #
    # Create Live Output
    #
    # Creates a Live Output.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param parameters [LiveOutput] Live Output properties needed for creation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def begin_create_async(resource_group_name, account_name, live_event_name, live_output_name, parameters, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, 'live_event_name is nil' if live_event_name.nil?
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'MaxLength': '32'" if !live_event_name.nil? && live_event_name.length > 32
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'MinLength': '1'" if !live_event_name.nil? && live_event_name.length < 1
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'Pattern': '^[a-zA-Z0-9]+(-*[a-zA-Z0-9])*$'" if !live_event_name.nil? && live_event_name.match(Regexp.new('^^[a-zA-Z0-9]+(-*[a-zA-Z0-9])*$$')).nil?
      fail ArgumentError, 'live_output_name is nil' if live_output_name.nil?
      fail ArgumentError, "'live_output_name' should satisfy the constraint - 'MaxLength': '256'" if !live_output_name.nil? && live_output_name.length > 256
      fail ArgumentError, "'live_output_name' should satisfy the constraint - 'MinLength': '1'" if !live_output_name.nil? && live_output_name.length < 1
      fail ArgumentError, "'live_output_name' should satisfy the constraint - 'Pattern': '^([a-zA-Z0-9])+(-*[a-zA-Z0-9])*$'" if !live_output_name.nil? && live_output_name.match(Regexp.new('^^([a-zA-Z0-9])+(-*[a-zA-Z0-9])*$$')).nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_mapper = Azure::MediaServices::Mgmt::V2018_07_01::Models::LiveOutput.mapper()
      request_content = @client.serialize(request_mapper,  parameters)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Media/mediaservices/{accountName}/liveEvents/{liveEventName}/liveOutputs/{liveOutputName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'accountName' => account_name,'liveEventName' => live_event_name,'liveOutputName' => live_output_name},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:put, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 202
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::MediaServices::Mgmt::V2018_07_01::Models::LiveOutput.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end
        # Deserialize Response
        if status_code == 202
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::MediaServices::Mgmt::V2018_07_01::Models::LiveOutput.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Delete Live Output
    #
    # Deletes a Live Output.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def begin_delete(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:nil)
      response = begin_delete_async(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:custom_headers).value!
      nil
    end

    #
    # Delete Live Output
    #
    # Deletes a Live Output.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def begin_delete_with_http_info(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:nil)
      begin_delete_async(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:custom_headers).value!
    end

    #
    # Delete Live Output
    #
    # Deletes a Live Output.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param live_output_name [String] The name of the Live Output.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def begin_delete_async(resource_group_name, account_name, live_event_name, live_output_name, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, 'live_event_name is nil' if live_event_name.nil?
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'MaxLength': '32'" if !live_event_name.nil? && live_event_name.length > 32
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'MinLength': '1'" if !live_event_name.nil? && live_event_name.length < 1
      fail ArgumentError, "'live_event_name' should satisfy the constraint - 'Pattern': '^[a-zA-Z0-9]+(-*[a-zA-Z0-9])*$'" if !live_event_name.nil? && live_event_name.match(Regexp.new('^^[a-zA-Z0-9]+(-*[a-zA-Z0-9])*$$')).nil?
      fail ArgumentError, 'live_output_name is nil' if live_output_name.nil?
      fail ArgumentError, "'live_output_name' should satisfy the constraint - 'MaxLength': '256'" if !live_output_name.nil? && live_output_name.length > 256
      fail ArgumentError, "'live_output_name' should satisfy the constraint - 'MinLength': '1'" if !live_output_name.nil? && live_output_name.length < 1
      fail ArgumentError, "'live_output_name' should satisfy the constraint - 'Pattern': '^([a-zA-Z0-9])+(-*[a-zA-Z0-9])*$'" if !live_output_name.nil? && live_output_name.match(Regexp.new('^^([a-zA-Z0-9])+(-*[a-zA-Z0-9])*$$')).nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Media/mediaservices/{accountName}/liveEvents/{liveEventName}/liveOutputs/{liveOutputName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'accountName' => account_name,'liveEventName' => live_event_name,'liveOutputName' => live_output_name},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:delete, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 202 || status_code == 204
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # List Live Outputs
    #
    # Lists the Live Outputs in the Live Event.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [LiveOutputListResult] operation results.
    #
    def list_next(next_page_link, custom_headers:nil)
      response = list_next_async(next_page_link, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # List Live Outputs
    #
    # Lists the Live Outputs in the Live Event.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_next_with_http_info(next_page_link, custom_headers:nil)
      list_next_async(next_page_link, custom_headers:custom_headers).value!
    end

    #
    # List Live Outputs
    #
    # Lists the Live Outputs in the Live Event.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_next_async(next_page_link, custom_headers:nil)
      fail ArgumentError, 'next_page_link is nil' if next_page_link.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '{nextLink}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          skip_encoding_path_params: {'nextLink' => next_page_link},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::MediaServices::Mgmt::V2018_07_01::Models::LiveOutputListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # List Live Outputs
    #
    # Lists the Live Outputs in the Live Event.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param live_event_name [String] The name of the Live Event.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [LiveOutputListResult] which provide lazy access to pages of the
    # response.
    #
    def list_as_lazy(resource_group_name, account_name, live_event_name, custom_headers:nil)
      response = list_async(resource_group_name, account_name, live_event_name, custom_headers:custom_headers).value!
      unless response.nil?
        page = response.body
        page.next_method = Proc.new do |next_page_link|
          list_next_async(next_page_link, custom_headers:custom_headers)
        end
        page
      end
    end

  end
end
