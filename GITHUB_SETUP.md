# GitHub & Vercel Setup Guide

## 🚀 Quick Deployment Steps

### Step 1: Create GitHub Repository

1. **Go to GitHub.com** and sign in
2. **Click "New repository"** (green button)
3. **Repository name**: `bonkamigos-web`
4. **Description**: `Bonkamigos - The degenerate dogs of Solana`
5. **Make it Public** (for free hosting)
6. **Don't initialize** with README (we already have one)
7. **Click "Create repository"**

### Step 2: Connect Local Repository to GitHub

Run these commands in your terminal:

```bash
# Add the remote repository (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/bonkamigos-web.git

# Push to GitHub
git push -u origin main
```

### Step 3: Deploy to Vercel

1. **Go to [vercel.com](https://vercel.com)**
2. **Sign up/Login** with your GitHub account
3. **Click "New Project"**
4. **Import your repository**: `bonkamigos-web`
5. **Click "Deploy"**

### Step 4: Custom Domain Setup

1. **In Vercel dashboard**, go to your project
2. **Settings → Domains**
3. **Add domain**: `bonkamigos.xyz`
4. **Update DNS records** as instructed by Vercel

## 🔧 Alternative: Command Line Deployment

If you prefer command line:

```bash
# Install Vercel CLI
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
vercel --prod
```

## 📋 DNS Configuration for bonkamigos.xyz

Add these records to your domain registrar:

```
Type: A
Name: @
Value: 76.76.19.76

Type: CNAME
Name: www
Value: cname.vercel-dns.com
```

## 🎯 Expected Results

After setup, your website will be available at:
- **Vercel URL**: `https://bonkamigos-web.vercel.app`
- **Custom Domain**: `https://bonkamigos.xyz` (after DNS setup)

## 🆘 Need Help?

If you encounter issues:
1. Check GitHub repository is public
2. Ensure Vercel is connected to your GitHub account
3. Verify DNS records are correct
4. Wait up to 24 hours for DNS propagation

---

**Ready to go live! 🚀** 