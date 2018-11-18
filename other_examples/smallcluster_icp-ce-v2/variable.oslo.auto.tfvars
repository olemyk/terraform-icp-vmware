#######################################
##### vSphere Access Credentials ######
#######################################
vsphere_server = "10.33.3.160"
# Set username/password as environment variables VSPHERE_USER and VSPHERE_PASSWORD

##############################################
##### vSphere deployment specifications ######
##############################################
# Following resources must exist in vSphere
vsphere_datacenter = "TEC"
vsphere_cluster = "prodGen8
vsphere_resource_pool = "terraform"
network_label = "VLAN 5"
datastore = "vmware_prod_power_lun06"
#Tested with Ubuntu 1604 and Centos 7.5
template = "vm_ubuntu1604LTS_template_150G_ICP"
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
staticipblock = "10.33.5.0/24"
staticipblock_offset = 183
gateway = "10.33.5.1"
netmask = "24"
dns_servers = [ "10.33.3.10", "10.33.3.11" ]

# Cluster access
cluster_vip = "10.33.5.180"
#Centos is default with ens192
cluster_vip_iface = "ens160"
proxy_vip = "10.33.5.181"
proxy_vip_iface = "ens160"

##### Local Terraform connectivity details #####
ssh_user = "root"
ssh_password = "change_me"

###### ICP installation method #####
## ibmcom/icp-inception:3.1.0 is CE and ibmcom/icp-inception-amd64:3.1.0-ee is enterprise
icp_inception_image = "ibmcom/icp-inception-amd64:3.1.0-ee"
image_location = "nfs:10.33.5.44:/storage/icp/3.1.0/GA/ibm-cloud-private-x86_64-3.1.0.tar.gz"
docker_package_location = "nfs:10.33.5.44:/storage/icp/3.1.0/GA/icp-docker-18.03.1_x86_64.bin"

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
}
proxy = {
    nodes = "1"
    vcpu = "4"
    memory = "8192"
    thin_provisioned = "true"
}
worker = {
    nodes = "3"
    vcpu = "8"
    memory = "8192"
    docker_disk_size = "200"
    thin_provisioned = "true"
}
management = {
    nodes = "1"
    vcpu = "4"
    memory = "16384"
    thin_provisioned = "true"
}
va = {
    nodes = "1"
    vcpu = "4"
    memory = "8192"
    thin_provisioned = "true"
}

####### NFS Server #####
registry_mount_src = "10.33.5.44:/storage/user1-icp-31/registry"
audit_mount_src = "10.33.5.44:/storage/user1-icp-31/audit"
