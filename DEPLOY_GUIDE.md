# Free deployment guide

## 1. GitHub
Upload this project to a **private** GitHub repository first. Do not upload credentials, `.env`, or database files.

## 2. Render backend
Create a new Render Blueprint from the GitHub repository using `render.yaml`. Choose the free service plan if available. Set `FRONTEND_ORIGINS` after deploying the frontend (e.g. `https://your-project.vercel.app`). Check `https://YOUR-RENDER-SERVICE.onrender.com/health`.

## 3. Vercel frontend
Import the same GitHub repository into Vercel. Set Root Directory to `frontend`, Framework Preset to Vite, Build Command `npm run build`, Output Directory `dist`. Add environment variable `VITE_API_URL` with the Render HTTPS base URL (no `/api`). Deploy.

## 4. CORS
Update `FRONTEND_ORIGINS` on Render to the exact Vercel URL, without a trailing slash. Redeploy/restart the backend.

## Limitations
Render free instances can sleep, interrupting WebSocket updates and background monitoring. The SQLite database stored on the instance is ephemeral and can be reset on restarts/redeployments. This is an academic simulation, not real cloud remediation. Do not expose administrative recovery controls publicly without authentication.
