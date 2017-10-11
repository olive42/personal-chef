name 'user-files'
maintainer 'The Authors'
maintainer_email 'olivier@tharan.org'
license 'mit'
description 'Installs/Configures user-files'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/olive42/personal-chef/issues' if
  respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
if respond_to?(:source_url)
  source_url 'https://github.com/olive42/personal-chef/tree/master/cookbooks/' \
             'user-files'
end
