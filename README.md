Ruby 1.9.3
==========

The rook application environment for Ruby 1.9.3 applications.


Scripts
-------

### init_wrapper

The entrypoint for this container. Sets environment variables to indicate what dependency containers are active. It then runs the init_permissions and init_app scripts, and finally continues with the normal init.


### init_permissions

Sets the uid and gid for the app user to match the uid and gid of the application mounted in the /app folder.


### init_app

Initializes the app environment.

If a Gemfile is found it will:
+   Run `bundle install`

If a Rails application is found it will:
+   Configure database.yml from a template
+   Wait for the database to be available
+   Run `bundle exec rake db:create`, `bundle exec rake db:migrate`, `bundle exec rake db:seed`

TODO:
Detect and configure other ruby webapplication frameworks. 
Provide hooks for custom application configuration and initialization, for unsupported applications.


Templates
---------

Contains template files that are available in the container during startup.
These are used by init_app to configure application databases.


Configuration
-------------

The nginx.conf file is located in /mount/config/
