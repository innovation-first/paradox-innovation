docker build \
-t innov-blog:latest \
--build-arg HUGO_BASEURL=http://localhost:8080 \
.



docker run -p 8080:80 innov-blog:latest