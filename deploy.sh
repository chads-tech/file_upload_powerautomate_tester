#!/bin/bash

# Azure App Service Deployment Script for FastAPI
# Usage: ./deploy.sh <app-name> <resource-group>

APP_NAME=$1
RESOURCE_GROUP=$2

if [ -z "$APP_NAME" ] || [ -z "$RESOURCE_GROUP" ]; then
    echo "Usage: ./deploy.sh <app-name> <resource-group>"
    echo "Example: ./deploy.sh my-fastapi-app my-resource-group"
    exit 1
fi

echo "==========================================="
echo "Deploying FastAPI to Azure App Service"
echo "App Name: $APP_NAME"
echo "Resource Group: $RESOURCE_GROUP"
echo "==========================================="

# Login to Azure (if not already logged in)
echo "Checking Azure login status..."
az account show > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Not logged in. Running az login..."
    az login
fi

# Configure the web app startup command
echo "Configuring startup command..."
az webapp config set \
    --name $APP_NAME \
    --resource-group $RESOURCE_GROUP \
    --startup-file "uvicorn jaron_functionapp_api:app --host 0.0.0.0 --port 8000"

# Deploy the application
echo "Deploying application..."
az webapp up \
    --name $APP_NAME \
    --resource-group $RESOURCE_GROUP \
    --runtime PYTHON:3.11 \
    --sku B1

echo "==========================================="
echo "Deployment complete!"
echo "Your API is available at: https://${APP_NAME}.azurewebsites.net"
echo "Upload endpoint: https://${APP_NAME}.azurewebsites.net/upload-file/"
echo "API docs: https://${APP_NAME}.azurewebsites.net/docs"
echo "==========================================="
