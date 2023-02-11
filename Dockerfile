FROM nikolaik/python-nodejs:python3.9-nodejs14

ENV NODE_WORKDIR /app
WORKDIR $NODE_WORKDIR

ADD . $NODE_WORKDIR

RUN apt-get update && apt-get install -y build-essential gcc wget git libvips fonts-noto && rm -rf /var/lib/apt/lists/*

RUN DEBIAN_FRONTEND="noninteractive" 

RUN npm install canvas@2.6.1 && npm install # TODO: canvas crashes if installed via npm install from package.json

CMD ["npm", "start"]
