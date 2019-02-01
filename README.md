# OMCompilerDocker
Dockerfile for the Open Modelica Compiler

Building this docker file creates an image that builds the Open Modelica compiler from source.
The OMCompiler is included as a submodule.

After cloning, cd into the repository and
`git submodule update --init --recursive`
to load the compiler source.

Next, build the image
`docker build --tag=myTag .`

The dockerfile creates/downloads an ubuntu18.04 base image, installs build tools and the OMCompiler's dependencies, configures the project, and makes it.
This will take perhaps 30min and will through up a variety of warnings and some minor errors.
If successful it will create an executable at /omcompiler/build/bin/omc

You can enter the image via
`docker run -it --cap-add=SYS_PTRACE myTag`
with the SYS_PTRACE option adding the ability to use gdb.
