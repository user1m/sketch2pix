# Start with Ubuntu base image
# FROM user1m/pix2pix
FROM ubuntu:16.04
MAINTAINER Claudius Mbemba <clmb@microsoft.com>

# Run image updates
RUN apt-get -y update --fix-missing; apt-get install -y apt-utils; apt-get install -y build-essential;
#apt-get -y upgrade;
RUN apt-get install -y curl; curl -sL "https://deb.nodesource.com/setup_8.x" | bash -; apt-get install -y npm;
#mv -f /usr/bin/nodejs /usr/bin/node

# Install Py Deps  pip install -r requirements.txt --no-index
#RUN wget https://bootstrap.pypa.io/get-pip.py; python get-pip.py; cp /usr/local/bin/pip /usr/bin; pip -V;
RUN apt-get install -y python-pip; pip install --upgrade pip; pip install requests[security];
RUN pip install opencv-python; pip install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp27-cp27mu-manylinux1_x86_64.whl; pip install torchvision dominate

# Install deps for Sketch tf-model
RUN apt-get install -y python-tk; pip install matplotlib pandas h5py tqdm sklearn keras tensorflow;

# SSH
RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd

#Copy the sshd_config file to its new location
COPY sketch2pix/sshd_config /etc/ssh/

# Configure ports
EXPOSE 2222 80 8080 443

# Start the SSH service
RUN service ssh start

# Set ENV Var
ENV PORT 80

# Set ~/home as working directory
WORKDIR /home

# Copy Project & API
COPY /sketch2pix sketch2pix
COPY /sketchme-api api
COPY /sketchme-webapp app

# Setup node
RUN cd api; mkdir uploads savedImages; npm i; cd ../app; npm i

# Start APP and API
CMD cd app; npm start & cd ../api; npm start

