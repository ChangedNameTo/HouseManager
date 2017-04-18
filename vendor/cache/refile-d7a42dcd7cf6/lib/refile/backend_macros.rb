module Refile
  # Macros which make it easier to write secure backends.
  #
  # @api private
  module BackendMacros
    def verify_id(method)
      mod = Module.new do
        define_method(method) do |id|
          id = self.class.decode_id(id)
          if self.class.valid_id?(id)
            super(id)
          else
            raise Refile::InvalidID
          end
        end
      end
      prepend mod
    end

    def verify_uploadable(method)
      mod = Module.new do
        define_method(method) do |uploadable|
          [:size, :read, :eof?, :rewind, :close].each do |m|
            unless uploadable.respond_to?(m)
              raise Refile::InvalidFile, "does not respond to `#{m}`."
            end
          end
          if max_size and uploadable.size > max_size
            raise Refile::InvalidMaxSize, "#{uploadable.inspect} is too large"
          end
          super(uploadable)
        end
      end
      prepend mod
    end

    def valid_id?(id)
      id =~ /\A[a-z0-9]+\z/i
    end

    def decode_id(id)
      id.to_s
    end
  end
end
