import os
from notebook.auth.security import set_password

password = os.environ.get("AWESOME_PASSWORD")
set_password(password)
