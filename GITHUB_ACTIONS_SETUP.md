# GitHub Actions Deployment Setup

This guide will help you set up automatic deployment to Azure App Service using GitHub Actions.

## Prerequisites
- A GitHub repository for this code
- The publish profile file (already generated: `publish-profile.xml`)

## Setup Steps

### 1. Create or Push to GitHub Repository

If you don't have a repo yet, create one:
```bash
cd /home/cquakenbush/workspace/scratchpad_random_testing
git init
git add .
git commit -m "Initial commit - FastAPI file upload endpoint"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git push -u origin main
```

### 2. Add Azure Publish Profile to GitHub Secrets

1. Go to your GitHub repository
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Name: `AZURE_WEBAPP_PUBLISH_PROFILE`
5. Value: Copy the **entire contents** of `publish-profile.xml` file
   ```bash
   cat publish-profile.xml
   ```
6. Click **Add secret**

### 3. Trigger Deployment

The workflow will automatically run when you:
- Push to the `main` branch
- Or manually trigger it from GitHub Actions tab

### 4. Monitor Deployment

1. Go to your GitHub repository
2. Click the **Actions** tab
3. You'll see the deployment workflow running
4. Click on it to see detailed logs

### 5. Test Your API

Once deployed, test at:
- Upload endpoint: https://evs-contract-tester-cpb3gedfegfxg5fq.azurewebsites.net/upload-file/
- API docs: https://evs-contract-tester-cpb3gedfegfxg5fq.azurewebsites.net/docs

## Files Created

- `.github/workflows/azure-deploy.yml` - GitHub Actions workflow
- `publish-profile.xml` - Azure credentials (DO NOT commit this file!)

## Important

Add `publish-profile.xml` to `.gitignore` to keep credentials safe:
```bash
echo "publish-profile.xml" >> .gitignore
```
