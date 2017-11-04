# This class disable the source/destination check on AWS instances
class calico::disable_source_destination_check{
  include calico
  include ::kubernetes

  $aws_region = $::calico::aws_region

  kubernetes::apply{'disable-srcdest-node':
    manifests => [
      template('calico/disable-source-destination.yaml.erb'),
    ],
  }
}
