# Bonkamigos Web Deployment Guide

This guide will help you deploy the Bonkamigos website to various hosting platforms.

## 🚀 Quick Deploy Options

### Option 1: Vercel (Recommended - Fastest)

1. **Install Vercel CLI:**
   ```bash
   npm install -g vercel
   ```

2. **Deploy:**
   ```bash
   vercel --prod
   ```

3. **Follow the prompts:**
   - Link to existing project or create new
   - Set project name: `bonkamigos-web`
   - Confirm deployment

4. **Custom Domain Setup:**
   - Go to Vercel Dashboard
   - Select your project
   - Go to Settings > Domains
   - Add `bonkamigos.xyz`
   - Update DNS records as instructed

### Option 2: Netlify

1. **Install Netlify CLI:**
   ```bash
   npm install -g netlify-cli
   ```

2. **Deploy:**
   ```bash
   netlify deploy --prod --dir=.
   ```

3. **Custom Domain Setup:**
   - Go to Netlify Dashboard
   - Select your site
   - Go to Domain Management
   - Add custom domain: `bonkamigos.xyz`

### Option 3: GitHub Pages

1. **Create GitHub Repository:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/yourusername/bonkamigos-web.git
   git push -u origin main
   ```

2. **Enable GitHub Pages:**
   - Go to repository Settings
   - Scroll to Pages section
   - Set source to "Deploy from a branch"
   - Select "main" branch
   - Save

3. **Custom Domain:**
   - Add `bonkamigos.xyz` in Pages settings
   - Create CNAME file in repository root

## 🌐 Custom Domain Setup (bonkamigos.xyz)

### DNS Configuration

Add these DNS records to your domain registrar:

#### For Vercel:
```
Type: A
Name: @
Value: 76.76.19.76

Type: CNAME
Name: www
Value: cname.vercel-dns.com
```

#### For Netlify:
```
Type: A
Name: @
Value: 75.2.60.5

Type: CNAME
Name: www
Value: your-site-name.netlify.app
```

#### For GitHub Pages:
```
Type: A
Name: @
Value: 185.199.108.153
Value: 185.199.109.153
Value: 185.199.110.153
Value: 185.199.111.153

Type: CNAME
Name: www
Value: yourusername.github.io
```

## 🔧 Environment Setup

### Prerequisites

- Node.js 14+ (for CLI tools)
- Git (for version control)
- Domain registrar access

### Local Development

1. **Clone/Download the project**
2. **Test locally:**
   ```bash
   ./deploy.sh test
   ```
3. **Open browser:** http://localhost:8000

## 📋 Pre-Deployment Checklist

- [ ] All files are present (index.html, package.json, etc.)
- [ ] Website works locally
- [ ] Images load correctly
- [ ] Links work properly
- [ ] Mobile responsiveness tested
- [ ] SEO meta tags are set
- [ ] Custom domain DNS configured
- [ ] SSL certificate enabled (automatic on most platforms)

## 🚀 Automated Deployment

Use the included deployment script:

```bash
# Test locally
./deploy.sh test

# Deploy to Vercel
./deploy.sh vercel

# Deploy to Netlify
./deploy.sh netlify

# Prepare for GitHub Pages
./deploy.sh github

# Deploy to all platforms
./deploy.sh all
```

## 🔍 Post-Deployment Verification

1. **Check website loads:** https://bonkamigos.xyz
2. **Test mobile responsiveness**
3. **Verify all links work**
4. **Check image loading**
5. **Test contact forms (if any)**
6. **Verify SEO meta tags**
7. **Check page speed** (Google PageSpeed Insights)

## 🛠️ Troubleshooting

### Common Issues

1. **Images not loading:**
   - Check image URLs are correct
   - Verify CDN is accessible
   - Check CORS settings

2. **Custom domain not working:**
   - Verify DNS records are correct
   - Wait for DNS propagation (up to 48 hours)
   - Check SSL certificate status

3. **Deployment fails:**
   - Check file permissions
   - Verify all required files exist
   - Check platform-specific requirements

### Performance Optimization

1. **Enable compression** (automatic on most platforms)
2. **Set cache headers** (configured in vercel.json/netlify.toml)
3. **Optimize images** (already optimized)
4. **Minify CSS/JS** (if needed)

## 📞 Support

If you encounter issues:

1. Check the platform's documentation
2. Review error logs in deployment dashboard
3. Test locally first
4. Verify DNS configuration

## 🎉 Success!

Once deployed, your Bonkamigos website will be live at:
- **Primary:** https://bonkamigos.xyz
- **Backup:** Your platform's default URL

The website includes:
- ✅ Modern, responsive design
- ✅ SEO optimization
- ✅ Fast loading times
- ✅ Mobile-friendly layout
- ✅ Security headers
- ✅ Analytics ready
- ✅ Social media integration ready

---

**Bonkamigos** - The degenerate dogs of Solana 🐕 