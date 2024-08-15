output "devenv_local_nix" {
  sensitive = true
  value = <<EOT
{pkgs, lib, ...}:{
  env = {
    AZURE_ACCOUNT_NAME = "${azurerm_storage_account.main.name}";
    AZURE_ACCESS_KEY = "${azurerm_storage_account.main.primary_access_key}";
    AZURE_PRIVATE_CONTAINER = "${azurerm_storage_container.private.name}";
    AZURE_PUBLIC_CONTAINER = "${azurerm_storage_container.public.name}";
  };
}
EOT
}

output "vm_ip" {
  value = var.create_vm ? azurerm_public_ip.main[0].ip_address : ""
}

output "vm_username" {
  value = var.vm_username
}
