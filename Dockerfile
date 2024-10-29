FROM node:16-stretch-slim

ENV PORT 3000

RUN useradd -m -s /bin/bash appuser
# Create app directory with the correct ownership
RUN mkdir -p /usr/src/app/trello && chown -R appuser:appuser /usr/src/app/trello
WORKDIR /usr/src/app/trello
USER appuser
COPY --chown=appuser:appuser package.json yarn.lock ./
RUN yarn install



# Copy application files with correct ownership
COPY --chown=appuser:appuser . .

EXPOSE 3000
CMD ["yarn", "dev"]
