# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::MediaServices::Mgmt::V2019_05_01_preview
  #
  # Transforms
  #
  class Transforms
    include MsRestAzure

    #
    # Creates and initializes a new instance of the Transforms class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [AzureMediaServices] reference to the AzureMediaServices
    attr_reader :client

    #
    # List Transforms
    #
    # Lists the Transforms in the account.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param filter [String] Restricts the set of items returned.
    # @param orderby [String] Specifies the key by which the result collection
    # should be ordered.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Array<Transform>] operation results.
    #
    def list(resource_group_name, account_name, filter:nil, orderby:nil, custom_headers:nil)
      first_page = list_as_lazy(resource_group_name, account_name, filter:filter, orderby:orderby, custom_headers:custom_headers)
      first_page.get_all_items
    end

    #
    # List Transforms
    #
    # Lists the Transforms in the account.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param filter [String] Restricts the set of items returned.
    # @param orderby [String] Specifies the key by which the result collection
    # should be ordered.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_with_http_info(resource_group_name, account_name, filter:nil, orderby:nil, custom_headers:nil)
      list_async(resource_group_name, account_name, filter:filter, orderby:orderby, custom_headers:custom_headers).value!
    end

    #
    # List Transforms
    #
    # Lists the Transforms in the account.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param filter [String] Restricts the set of items returned.
    # @param orderby [String] Specifies the key by which the result collection
    # should be ordered.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_async(resource_group_name, account_name, filter:nil, orderby:nil, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      api_version = '2018-07-01'


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Media/mediaServices/{accountName}/transforms'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'accountName' => account_name},
          query_params: {'api-version' => api_version,'$filter' => filter,'$orderby' => orderby},
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
            result_mapper = Azure::MediaServices::Mgmt::V2019_05_01_preview::Models::TransformCollection.mapper()
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
    # Get Transform
    #
    # Gets a Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Transform] operation results.
    #
    def get(resource_group_name, account_name, transform_name, custom_headers:nil)
      response = get_async(resource_group_name, account_name, transform_name, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Get Transform
    #
    # Gets a Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_with_http_info(resource_group_name, account_name, transform_name, custom_headers:nil)
      get_async(resource_group_name, account_name, transform_name, custom_headers:custom_headers).value!
    end

    #
    # Get Transform
    #
    # Gets a Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(resource_group_name, account_name, transform_name, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, 'transform_name is nil' if transform_name.nil?
      api_version = '2018-07-01'


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Media/mediaServices/{accountName}/transforms/{transformName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'accountName' => account_name,'transformName' => transform_name},
          query_params: {'api-version' => api_version},
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
            result_mapper = Azure::MediaServices::Mgmt::V2019_05_01_preview::Models::Transform.mapper()
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
    # Create or Update Transform
    #
    # Creates or updates a new Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param parameters [Transform] The request parameters
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Transform] operation results.
    #
    def create_or_update(resource_group_name, account_name, transform_name, parameters, custom_headers:nil)
      response = create_or_update_async(resource_group_name, account_name, transform_name, parameters, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Create or Update Transform
    #
    # Creates or updates a new Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param parameters [Transform] The request parameters
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def create_or_update_with_http_info(resource_group_name, account_name, transform_name, parameters, custom_headers:nil)
      create_or_update_async(resource_group_name, account_name, transform_name, parameters, custom_headers:custom_headers).value!
    end

    #
    # Create or Update Transform
    #
    # Creates or updates a new Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param parameters [Transform] The request parameters
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def create_or_update_async(resource_group_name, account_name, transform_name, parameters, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, 'transform_name is nil' if transform_name.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      api_version = '2018-07-01'


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_mapper = Azure::MediaServices::Mgmt::V2019_05_01_preview::Models::Transform.mapper()
      request_content = @client.serialize(request_mapper,  parameters)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Media/mediaServices/{accountName}/transforms/{transformName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'accountName' => account_name,'transformName' => transform_name},
          query_params: {'api-version' => api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:put, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 201
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
            result_mapper = Azure::MediaServices::Mgmt::V2019_05_01_preview::Models::Transform.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end
        # Deserialize Response
        if status_code == 201
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::MediaServices::Mgmt::V2019_05_01_preview::Models::Transform.mapper()
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
    # Delete Transform
    #
    # Deletes a Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def delete(resource_group_name, account_name, transform_name, custom_headers:nil)
      response = delete_async(resource_group_name, account_name, transform_name, custom_headers:custom_headers).value!
      nil
    end

    #
    # Delete Transform
    #
    # Deletes a Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def delete_with_http_info(resource_group_name, account_name, transform_name, custom_headers:nil)
      delete_async(resource_group_name, account_name, transform_name, custom_headers:custom_headers).value!
    end

    #
    # Delete Transform
    #
    # Deletes a Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def delete_async(resource_group_name, account_name, transform_name, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, 'transform_name is nil' if transform_name.nil?
      api_version = '2018-07-01'


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Media/mediaServices/{accountName}/transforms/{transformName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'accountName' => account_name,'transformName' => transform_name},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:delete, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 204
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
    # Update Transform
    #
    # Updates a Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param parameters [Transform] The request parameters
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Transform] operation results.
    #
    def update(resource_group_name, account_name, transform_name, parameters, custom_headers:nil)
      response = update_async(resource_group_name, account_name, transform_name, parameters, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Update Transform
    #
    # Updates a Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param parameters [Transform] The request parameters
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def update_with_http_info(resource_group_name, account_name, transform_name, parameters, custom_headers:nil)
      update_async(resource_group_name, account_name, transform_name, parameters, custom_headers:custom_headers).value!
    end

    #
    # Update Transform
    #
    # Updates a Transform.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param transform_name [String] The Transform name.
    # @param parameters [Transform] The request parameters
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def update_async(resource_group_name, account_name, transform_name, parameters, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'account_name is nil' if account_name.nil?
      fail ArgumentError, 'transform_name is nil' if transform_name.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      api_version = '2018-07-01'


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_mapper = Azure::MediaServices::Mgmt::V2019_05_01_preview::Models::Transform.mapper()
      request_content = @client.serialize(request_mapper,  parameters)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Media/mediaServices/{accountName}/transforms/{transformName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'accountName' => account_name,'transformName' => transform_name},
          query_params: {'api-version' => api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:patch, path_template, options)

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
            result_mapper = Azure::MediaServices::Mgmt::V2019_05_01_preview::Models::Transform.mapper()
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
    # List Transforms
    #
    # Lists the Transforms in the account.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [TransformCollection] operation results.
    #
    def list_next(next_page_link, custom_headers:nil)
      response = list_next_async(next_page_link, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # List Transforms
    #
    # Lists the Transforms in the account.
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
    # List Transforms
    #
    # Lists the Transforms in the account.
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
            result_mapper = Azure::MediaServices::Mgmt::V2019_05_01_preview::Models::TransformCollection.mapper()
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
    # List Transforms
    #
    # Lists the Transforms in the account.
    #
    # @param resource_group_name [String] The name of the resource group within the
    # Azure subscription.
    # @param account_name [String] The Media Services account name.
    # @param filter [String] Restricts the set of items returned.
    # @param orderby [String] Specifies the key by which the result collection
    # should be ordered.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [TransformCollection] which provide lazy access to pages of the
    # response.
    #
    def list_as_lazy(resource_group_name, account_name, filter:nil, orderby:nil, custom_headers:nil)
      response = list_async(resource_group_name, account_name, filter:filter, orderby:orderby, custom_headers:custom_headers).value!
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
