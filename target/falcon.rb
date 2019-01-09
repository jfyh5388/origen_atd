# The target file is run before *every* Origen operation and is used to instantiate
# the runtime environment - usually this means instantiating a top-level SoC or
# IP model.
ATDTest::Falcon.new(version: 0)   # Instantiate a DUT instance
