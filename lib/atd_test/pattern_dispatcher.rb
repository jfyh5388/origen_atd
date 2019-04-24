module ATDTest
  class PatternDispatcher

    def dispatch_or_return(requested_pattern)
      # If the pattern name contains 'custom' just return the name to have Origen lookup a source file for it
      if requested_pattern =~ /custom/
        requested_pattern
      else
        generate(requested_pattern)
        false   # Return false to Origen to prevent std pattern dispatch
      end
    end

    def generate(requested_pattern)
      # Logic to generate the pattern to be added here
    end

  end
end
