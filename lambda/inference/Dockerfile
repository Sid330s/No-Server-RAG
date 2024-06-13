FROM public.ecr.aws/lambda/nodejs:18
COPY  package*.json ./
RUN npm install
COPY index.mjs ./
CMD ["index.handler"]