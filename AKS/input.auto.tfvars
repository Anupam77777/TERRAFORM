aks_vnet_name = "aksvnet"

sshkvsecret = "akssshpubkey"

clientidkvsecret = "spn-id"

spnkvsecret = "spn-secret"

vnetcidr = ["10.0.0.0/24"]

subnetcidr = ["10.0.0.0/25"]

keyvault_rg = "aksdemo-rg"

keyvault_name = "anuaksvault"

azure_region = "EastUS"

resource_group = "MYFIRSTRG"

cluster_name = "akscluster"

dns_name = "aksdemocluster"

admin_username = "aksuser"

kubernetes_version = "1.29.10"

agent_pools = {
      name            = "pool1"
      count           = 2
      vm_size         = "Standard_D2_v2"
      os_disk_size_gb = "30"
    }