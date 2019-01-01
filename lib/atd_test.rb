require 'origen'
module ATDTest
  # Example of how to explicitly require a file
  # require "atd_test/my_file"

  # Load all files in the lib/atd_test directory.
  # Note that there is no problem from requiring a file twice (Ruby will ignore
  # the second require), so if you have a file that must be required first, then
  # explicitly require it up above and then let this take care of the rest.
  Dir.glob("#{File.dirname(__FILE__)}/atd_test/**/*.rb").sort.each do |file|
    require file
  end
end
