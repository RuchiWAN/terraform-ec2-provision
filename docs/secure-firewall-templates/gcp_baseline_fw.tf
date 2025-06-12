resource "google_compute_firewall" "baseline_fw_ssh_http" {
  name    = "baseline-fw-ssh-http"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["YOUR_TRUSTED_IP/32", "0.0.0.0/0"] # Customize per use case

  direction    = "INGRESS"
  priority     = 1000
  target_tags  = ["baseline-servers"]
}

resource "google_compute_firewall" "baseline_fw_egress" {
  name    = "baseline-fw-egress"
  network = google_compute_network.vpc.name

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
  direction          = "EGRESS"
  priority           = 1000
}
