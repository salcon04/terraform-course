# Provisioners
#Bloques de recursos que permiten ejecutar algunas acciones, (scripts, etc)

# file, copia archivos desde la local a algun recurso remoto generalmente VM
# remote-exec Ejecuta comandos en los recursos remotos (ssh o winrm)
# local-exec Ejecuta comandos en mi maquina local
# null_resourse no crea infra, pero permite usar provisiners independientemente del recurso

resource "null_resource" "run_script" {
  provisioner "local-exec" {
    command = "az account show"
  }
}

resource "tls_private_key" "generated" {
  algorithm = "RSA"
}

resource "local_file" "privated_key" {
  content  = tls_private_key.generated.private_key_pem
  filename = "myazkey.pem"
}



