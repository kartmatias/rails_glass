class ApiVersionConstraint
    def initialize(options)
        @version = options[:version] 
        @default = options[:default]           
    end
    # terminando com ? por padrao retornoa true ou false
    def matchers?(req)
        @default || req.headers['Accept'].include?("application/vnd.glass.v#{@version}")
    end    
end