@echo off

echo "%PUSH_IMAGE%"

if not "%IMAGE%" == "" goto OkImage

:okImage
 
 docker build -t %IMAGE% -f .\Dockerfile.dev %BUILD_CONTEXT%
 if not "%PUSH_IMAGE%" == "true" goto end
 docker push %IMAGE% 

:end
 echo "Please run kubectl delete -f k8s\app.yaml after you terminate the watch"

