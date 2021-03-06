### Node Cache Stage
FROM node:14-alpine as node_cache
# Configure path
WORKDIR /src/
RUN chmod -R 777 /src/
# Install app dependecies
USER node
COPY api/package.json .
# Install dependencies
RUN yarn install


### App Stage
FROM node:14-alpine
# Setting up envs
ENV N_PATH "/usr/src/app"
ENV N_USER "node"
# Install nodemon or pm2 for production
RUN npm install -g pm2 nodemon
# Create app dir
WORKDIR ${N_PATH}
RUN chmod -R 777 ${N_PATH}
# Adding files to project
COPY ./api .
RUN chown -R ${N_USER}:${N_USER} .
COPY --chown=$N_USER:$N_USER --from=node_cache /src/node_modules ./node_modules
COPY --chown=$N_USER:$N_USER --from=node_cache /src/yarn.lock ./yarn.lock

# Setting up logs dir
RUN mkdir -p /home/${N_USER}/.npm/_logs
RUN chown -R ${N_USER}:${N_USER} /home/${N_USER}/.npm

USER ${N_USER}
# CMD [ "yarn", "start" ]
CMD [ "pm2", "logs" ]
# CMD [ "nodemon", "-L", "./app.js" ]
# CMD [ "pm2-runtime", "/usr/src/app/ecosystem.json" ]

EXPOSE 3000
