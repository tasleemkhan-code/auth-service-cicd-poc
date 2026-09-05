job "auth-service" {
  datacenters = ["dc1"]
  namespace   = "NOMAD_NAMESPACE_PLACEHOLDER"

  group "auth" {
    network {
      port "http" {
        static = PORT_PLACEHOLDER
      }
    }

    task "auth-service" {
      driver = "docker"

      config {
        image = "IMAGE_TAG"
        ports = ["http"]
      }

      env {
        JWT_SECRET = "will-come-from-vault-later"
      }

      resources {
        cpu    = 200
        memory = 256
      }
    }
  }
}
