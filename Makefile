## Input Files

default : install

build : clean
	R CMD build pkg
	R CMD Rd2pdf pkg
	tar -xvf envvars_*

check : build
	R CMD check envvars_*

crancheck :
	R CMD check --as-cran envvars_*

install : clean
	R CMD INSTALL pkg

fullinstall : build
	R CMD INSTALL envvars*.tar.gz

remove :
	R CMD REMOVE envvars

test :
	cd pkg/tests ; Rscript test-all.R

clean :
