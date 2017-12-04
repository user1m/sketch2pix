# Start with Ubuntu base image
FROM user1m/pix2pix
MAINTAINER Claudius Mbemba <clmb@microsoft.com>

# Run image updates
RUN sudo apt-get update; curl -sL "https://deb.nodesource.com/setup_8.x" | sudo bash -; sudo apt-get install -y nodejs; 
#sudo mv -f /usr/bin/nodejs /usr/bin/node

# Install Py Deps #sudo pip install -r requirements.txt --no-index
RUN wget https://bootstrap.pypa.io/get-pip.py; python get-pip.py; cp /usr/local/bin/pip /usr/bin; pip -V; pip install requests[security]
RUN sudo pip install opencv-python; pip install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp27-cp27mu-manylinux1_x86_64.whl; pip install torchvision dominate

# Install deps for Sketch tf-model
RUN sudo apt-get install -y python-tk; pip install matplotlib pandas h5py tqdm sklearn keras tensorflow

# Set ~/home as working directory
WORKDIR /home

# Set ENV Var
ENV PORT 80

# Expose ports
EXPOSE 80 8080 443

# Copy Project & API
COPY /sketch2pix sketch2pix 
COPY /sketchme-api api
COPY /sketchme-webapp app

# Setup node
RUN cd api; mkdir uploads savedImages; npm i; cd ../app; npm i

# Start APP and API
CMD cd app; sudo npm start & cd ../api; sudo npm start

