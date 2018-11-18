#######################################
##### vSphere Access Credentials ######
#######################################
vsphere_server = "10.33.23.119"
# Set username/password as environment variables VSPHERE_USER and VSPHERE_PASSWORD

##############################################
##### vSphere deployment specifications ######
##############################################
# Following resources must exist in vSphere
vsphere_datacenter = "LBS"
vsphere_cluster = "LBS-Cluster"
vsphere_resource_pool = "terraform"
network_label = "VM Network"
datastore = "ESX_Flex_LUN4"
#Tested with Ubuntu 1604 and Centos 7.5 (lbscentostemplate75) (lbsubuntutemplate1604icp) preloaded docker(lbsubuntutemplate1604icpv2)
template = "lbscentostemplate75"
# Folder to provision the new VMs in, does not need to exist in vSphere
folder = "ibmcloudprivate"

##################################
##### ICP deployment details #####
##################################

##### ICP instance name #####
# MUST consist of only lower case alphanumeric characters and '-'
instance_name = "icptest"

##### Network #####
#staticipblock_offset is the start_iprange
#staticipblock = "10.33.23.0/24"
#staticipblock_offset = 180
gateway = "10.33.23.1"
netmask = "24"
dns_servers = [ "10.33.23.110", "8.8.8.8" ]

# Cluster access
#cluster_vip = "10.33.23.178"
#Centos is default with ens192 - ubuntu ens160
#cluster_vip_iface = "ens192"
#proxy_vip = "10.33.23.179"
#proxy_vip_iface = "ens192"

##### Local Terraform connectivity details #####
ssh_user = "root"
#ssh_password = "change_me"

###### ICP installation method #####
## ibmcom/icp-inception:3.1.0 is CE and ibmcom/icp-inception-amd64:3.1.0-ee is enterprise
icp_inception_image = "ibmcom/icp-inception:3.1.1"
#image_location = "nfs:10.33.5.44:/storage/icp/3.1.0/GA/ibm-cloud-private-x86_64-3.1.0.tar.gz"
#docker_package_location = "nfs:10.33.5.44:/storage/icp/3.1.0/GA/icp-docker-18.03.1_x86_64.bin"

###### ICP installation method #####
#icp_inception_image = "ibmcom/icp-inception-amd64:3.1.0-ee"
#private_registry    = "registry.example.com"
#registry_username   = "myUsername"
#registry_password   = "myPassword"

##### ICP admin user password #####
# Non default admin user password 'admin' recommended
icppassword = "admin"

##### ICP Cluster Components #####
master = {
    nodes = "1"
    vcpu = "8"
    memory = "16384"
	  disk_size = "250"
    thin_provisioned = "true"
    start_iprange = "10.33.33.180"
}
proxy = {
    nodes = "1"
    vcpu = "4"
    memory = "8192"
    thin_provisioned = "true"
    start_iprange = "10.33.33.181"
}
worker = {
    nodes = "3"
    vcpu = "8"
    memory = "8192"
    docker_disk_size = "200"
    thin_provisioned = "true"
    start_iprange = "10.33.33.182"
}

#management = {
#    nodes = "1"
#    vcpu = "4"
#    memory = "16384"
#    thin_provisioned = "true"
#    start_iprange = "10.33.33.180"
#}
#va = {
#    nodes = "1"
#    vcpu = "4"
#    memory = "8192"
#    thin_provisioned = "true"
#    start_iprange = "10.33.33.180"
#}

####### NFS Server #####
#registry_mount_src = "10.33.5.44:/storage/user1-icp-31/registry"
#audit_mount_src = "10.33.5.44:/storage/user1-icp-31/audit"
