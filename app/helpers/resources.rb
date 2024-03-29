require_relative 'resource'
require_relative 'file_resource'
require_relative 'resource_loaders/erb_loader'
require_relative 'resource_loaders/json_loader'
require_relative 'resource_loaders/phases_loader'
require_relative 'resource_validators/erb_validator'
require_relative 'resource_validators/module_validator'
require_relative 'resource_validators/phases_validator'
require_relative 'resource_validators/users_validator'
require_relative 'resource_validators/permissions_validator'
require_relative 'resource_validators/quizzes_validator'
require_relative 'resource_validators/karma_validator'

class Resources
  INDEX_PAGE  = FileResource.new(ENV['CONFIG_URL'] + 'index.erb', ERBLoader, ERBValidator, :not_found)
  MODULE      = FileResource.new(ENV['CONFIG_URL'] + 'module.json', JSONLoader, ModuleValidator, {})
  USERS       = FileResource.new(ENV['CONFIG_URL'] + 'users.json', JSONLoader, UsersValidator, {})
  PERMISSIONS = FileResource.new(ENV['CONFIG_URL'] + 'permissions.json', JSONLoader, PermissionsValidator, {})
  QUIZZES     = FileResource.new(ENV['CONFIG_URL'] + 'quizzes.json', JSONLoader, QuizzesValidator, {})
  KARMA       = FileResource.new(ENV['CONFIG_URL'] + 'karma.json', JSONLoader, KarmaValidator, {})
  PHASES      = Resource.new(PhasesLoader, PhasesValidator, {})
end