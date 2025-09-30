# Base image
FROM nginx:latest

# Maintainer info
LABEL maintainer="prakash6333"

# Copy custom index.html into nginx default folder
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
