Sample applications for [Building Red Hat Device Edge Images](https://github.com/RedHatQuickCourses/rhde-build)

Listing samples in the order the courses uses them:

* blueprints: blueprints for creating edge images
* ks: kickstart files for installing test VMs

The antora.yml file and modules directory support using this git repo as a content source from Antora, so source files here can be used directly in code listings on course materials, by using asciidoc include:: directives. Inside the modules directory, each subdirectory should use the same name as a top-level directory and have a single file named examples which is a symlink to the top level directory, so it complies with Antora's module structure.
