docker build -t registry.thalesdigital.io/tsn/innovation/projects/blog/deployer:latest .
docker push registry.thalesdigital.io/tsn/innovation/projects/blog/deployer:latest

docker pull hugomods/hugo:exts
docker tag hugomods/hugo:exts registry.thalesdigital.io/tsn/innovation/projects/blog/hugo:exts
docker push registry.thalesdigital.io/tsn/innovation/projects/blog/hugo:exts

docker pull hugomods/hugo:nginx
docker tag hugomods/hugo:nginx registry.thalesdigital.io/tsn/innovation/projects/blog/hugo:nginx
docker push registry.thalesdigital.io/tsn/innovation/projects/blog/hugo:nginx

docker pull docker:24.0.5
docker tag docker:24.0.5 registry.thalesdigital.io/tsn/innovation/projects/blog/docker:24.0.5
docker push registry.thalesdigital.io/tsn/innovation/projects/blog/docker:24.0.5

docker pull docker:24.0.5-dind
docker tag docker:24.0.5-dind registry.thalesdigital.io/tsn/innovation/projects/blog/docker:24.0.5-dind
docker push registry.thalesdigital.io/tsn/innovation/projects/blog/docker:24.0.5-dind

docker pull alpine/helm:latest
docker tag alpine/helm registry.thalesdigital.io/tsn/innovation/projects/blog/helm:latest
docker push registry.thalesdigital.io/tsn/innovation/projects/blog/helm:latest

helm pull private-helm-kast/sso-proxy
curl --fail-with-body --request POST \
  --form "chart=@sso-proxy-1.1.2+4.1.4.tgz" \
  --user $USERNAME:$ACCESS_TOKEN \
  https://gitlab.thalesdigital.io/api/v4/projects/56500/packages/helm/api/dev/charts

helm pull private-helm-kast/keycloak-client
  curl --fail-with-body --request POST \
    --form "chart=@keycloak-client-2.0.0.tgz" \
    --user $USERNAME:$ACCESS_TOKEN \
    https://gitlab.thalesdigital.io/api/v4/projects/56500/packages/helm/api/dev/charts
