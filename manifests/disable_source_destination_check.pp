# This class disable the source/destination check on AWS instances
class calico::disable_source_destination_check() inherits ::calico::params
{
  include ::calico
  include ::kubernetes

  kubernetes::apply{'disable-srcdest-node':
    manifests => [
      template('calico/disable-source-destination.yaml.erb'),
    ],
  }
}
