# Local resources

# Save kubeconfig file for interacting with the RKE cluster on your local machine
resource "local_file" "kube_config_server_yaml" {
  filename = format("%s/%s", var.kubeconfig_output_file_path, "kube_config_server.yaml")
  content  = rke_cluster.rancher_cluster.kube_config_yaml
}

resource "local_file" "kube_config_workload_yaml" {
  filename = format("%s/%s", var.kubeconfig_output_file_path, "kube_config_workload.yaml")
  content  = rancher2_cluster.workload.kube_config
}
