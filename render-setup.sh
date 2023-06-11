#!/bin/bash

yarn install

cp .env.example .env

sed -i -e "s|^NEXTAUTH_SECRET=.*|NEXTAUTH_SECRET=${RENDER_NEXTAUTH_SECRET}|" \
       -e "s|^CALENDSO_ENCRYPTION_KEY=.*|CALENDSO_ENCRYPTION_KEY=${RENDER_CALENDSO_ENCRYPTION_KEY}|" \
       -e "s|^DATABASE_URL=.*|DATABASE_URL=${RENDER_POSTGRES_CONN_STR}|" \
       .env

cp .env.appStore.example .env.appStore

sed -i -e "s|^DAILY_API_KEY=.*|DAILY_API_KEY=${RENDER_DAILY_API_KEY}|" \
       .env.appStore

echo "DATABASE_URL=${RENDER_POSTGRES_CONN_STR}" >> env.appStore

yarn workspace @calcom/prisma db-deploy
