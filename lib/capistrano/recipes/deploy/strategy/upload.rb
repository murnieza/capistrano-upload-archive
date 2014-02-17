require 'capistrano/recipes/deploy/strategy/base'

module Capistrano
  module Deploy
    module Strategy

      # This class implements a strategy for deployments with prebuilt
      # packages. It copies the package to each target host and uncompresses
      # it to the release directory. While normally discouraged, you
      # usually want to use the :none SCM with this strategy (or for even less
      # overhead, the :passthrough SCM from capistrano-deploy-scm-passthrough).
      # You'll also need to set :repository to the target archive.
      #
      #   set :scm, :none
      #   set :deploy_via, :upload
      #   set :repository, "target/#{application}.tar.gz"
      #
      # This strategy is meant to be a drop-in replacement for the :copy
      # strategy.
      class Upload < Base
        # Copies the package to all target servers, and uncompresses it on
        # each of them into the deployment directory.
        def deploy!
          distribute!
        end

        private
          # Distributes the file to the remote hosts.
          def distribute!
            args = [ filename, remote_filename ]
            args << { :via => configuration[:copy_via] } if configuration[:copy_via]
            upload(*args)
          end
      end

    end
  end
end
