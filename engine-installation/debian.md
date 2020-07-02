# Debian

1. Download install script

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
```

2. Execute install script

```bash
sudo sh get-docker.sh
```

3. Install Docker Compose

```bash
sudo apt install -y docker-compose
```

4. Grant user docker command permission (Optional)

```bash
sudo usermod -aG docker $(whoami)
```

