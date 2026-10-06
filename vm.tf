resource "azurerm_linux_virtual_machine" "vm1" {
  name                = "terra-learn-vm1"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B2ps_v2"

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.vm1.id
  ]

  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx

    systemctl enable nginx
    systemctl start nginx

    cat > /var/www/html/index.html <<'HTML'
    <html>
      <body>
        <h1>Hello from VM-1</h1>
        <p>Terra Learn Load Balancer</p>
      </body>
    </html>
    HTML
  EOF
  )
}

resource "azurerm_linux_virtual_machine" "vm2" {
  name                = "terra-learn-vm2"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B2ps_v2"

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.vm2.id
  ]

  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx

    systemctl enable nginx
    systemctl start nginx

    cat > /var/www/html/index.html <<'HTML'
    <html>
      <body>
        <h1>Hello from VM-2</h1>
        <p>Terra Learn Load Balancer</p>
      </body>
    </html>
    HTML
  EOF
  )
}