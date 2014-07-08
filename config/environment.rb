# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Kudos::Application.initialize!

# setup logging for /var/log/messages
layout = Logging.layouts.pattern(:pattern => "%l %m")
appender = Logging.appenders.syslog('kudos_application', :layout => layout, :facility => Syslog::LOG_LOCAL6)
Log = Logging.logger['KUDOS']
Log.appenders = appender
