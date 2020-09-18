FROM python:3.7

LABEL tech.tomy.docker.jupyter="3.7-1.0"
LABEL maintainer="Tomy Hsieh @tomy0000000"

# Upgrade to latest version of pip
RUN pip install --upgrade pip

# Use non-root user
RUN useradd -m jupyter
USER jupyter
WORKDIR /home/jupyter
EXPOSE 8888
ENV PATH="/home/jupyter/.local/bin:${PATH}"

# Install default requirements
COPY config/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN rm requirements.txt

# Copy initial script
COPY --chown=jupyter:jupyter config/init.sh /home/init.sh
RUN chmod +x /home/init.sh
COPY config/set_password.py /home/set_password.py

# Create configuration
COPY --chown=jupyter:jupyter config/jupyter_notebook_config.py .jupyter/jupyter_notebook_config.py
RUN ["jupyter", "nbextensions_configurator", "enable", "--user"]
RUN ["jupyter", "contrib", "nbextension", "install", "--user"]

# Read password from environment variable and start server
CMD ["/home/init.sh"]
