# Allow SSH (TCP 22) only from trusted IPs
resource "google_compute_firewall" "baseline_fw_ssh" {
  name    = "baseline-fw-ssh"
  network = google_compute_network.vpc.name

  direction   = "INGRESS"
  priority    = 1000
  target_tags = ["baseline-servers"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["YOUR_TRUSTED_IP/32"]
}

# Allow HTTP (TCP 80) from anywhere
resource "google_compute_firewall" "baseline_fw_http" {
  name    = "baseline-fw-http"
  network = google_compute_network.vpc.name

  direction   = "INGRESS"
  priority    = 1000
  target_tags = ["baseline-servers"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow all outbound traffic (default egress)
resource "google_compute_firewall" "baseline_fw_egress" {
  name    = "baseline-fw-egress"
  network = google_compute_network.vpc.name

  direction           = "EGRESS"
  priority            = 1000
  destination_ranges  = ["0.0.0.0/0"]

  allow {
    protocol = "all"
  }
}