FROM gcr.io/instruqt/vnc

RUN apt-get update && \
  apt-get install -y apt-transport-https curl

RUN touch /etc/apt/sources.list.d/nodesource.list
RUN echo "deb https://deb.nodesource.com/node_6.x xenial main" > /etc/apt/sources.list.d/nodesource.list
RUN echo "deb-src https://deb.nodesource.com/node_6.x xenial main" >> /etc/apt/sources.list.d/nodesource.list

RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN apt-get update

# Should install Node 6
RUN apt-get install -y nodejs

# Install Git client
RUN apt-get update && apt-get install -y git
RUN git --version

# Install Cypress dependencies (separate commands to avoid time outs)
RUN apt-get install -y \
    libgtk2.0-0
RUN apt-get install -y \
    libnotify-dev
RUN apt-get install -y \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    xvfb
RUN apt-get install -y \
    libasound2

COPY --from=whogloo/nodespeed-ide:latest /var/brackets-server/ /var/brackets-server/

ADD brackets-server /home/user/.brackets-server

RUN chown -R user:user /home/user/.brackets-server && \
    /home/user/.brackets-server/install-extensions.sh && \
    chown -R user:user /var/brackets-server

WORKDIR /home/user
USER user

RUN npm install --save-dev cypress

USER root
RUN ln -s /home/user/cypress/integration/ /projects
ADD start.sh /start.sh