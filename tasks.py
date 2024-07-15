from invoke import task


DOCKER_REPO_NAME = "tobygriffin/marywadefamily"


@task
def docker_build(c):
    if len(c.run("git status --porcelain").stdout):
        print("There are uncommitted changes in the working directory.")
        return
    tag_name = c.run("git rev-parse --short HEAD").stdout[:-1]
    image_name = DOCKER_REPO_NAME + ":" + tag_name
    c.run(
        "docker buildx build --platform linux/amd64 "
        "--push -t {} .".format(image_name)
    )
