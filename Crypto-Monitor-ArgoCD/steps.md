create one more branch "CI"
cd manifests/frontend.yml
make changes in this line
image: vinitkulkarni/crypto-monitor-img:{BUILD_ID}
{BUILD_ID} will be replaced with jenkins build number 
where argocd triggers do the auto deployment
