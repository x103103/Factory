require "factory/version"

module Factory
  class Factory
    def self.new(*args, &block)
      args.each {|item| raise TypeError, 'Symbols expected' unless item.kind_of?(Symbol)}

      instance = Class.new do
        define_method :initialize do |*instance_args|
          @data = {}
          args.each_with_index do |arg, index|
            @data[arg] = instance_args[index]
          end
        end

        args.each do |arg|
          define_method arg do
            @data[arg]
          end
        end

        def [](key)
          if key.kind_of?(Symbol)
            @data[key]
          elsif key.kind_of?(String)
            @data[key.to_sym]
          elsif key.kind_of?(Integer)
            data_a = @data.to_a
            data_a[key].last if key < data_a.size
          end
        end

      end

      instance.class_eval &block if block_given?

      return instance
    end
  end
end
