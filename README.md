# adk-renovation-single-agent


1. Clone repo or ccreate your project folder and copy paste the contents 

2. Test it locally:

adk run .
adk web


3. Deploy to Cloud Run:

gcloud run deploy adk-renovation-agent-single \
  --source . \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated \
  --set-env-vars GOOGLE_API_KEY=<<>>
