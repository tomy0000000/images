import sys
import yaml
from notebook.auth.security import set_password

# Read password from environment variable
username = sys.argv[1]
password = sys.argv[2]

# Setting jupyter password
set_password(password)

# Setting code server password
with open(f"/home/{username}/.config/code-server/config.yaml") as f:
    config = yaml.load(f, Loader=yaml.SafeLoader)
config["password"] = password
with open(f"/home/{username}/.config/code-server/config.yaml", "w") as f:
    config = yaml.dump(config, f)
