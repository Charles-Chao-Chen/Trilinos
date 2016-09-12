#Sample script for building using CMAKE on linux workstation octopi.

# Clean up the mess from previous configurations.
#-D CMAKE_C_FLAGS:STRING="-DKLU_ENABLE_OPENMP -fopenmp -m64" \
#-D SuperLU_LIBRARY_NAMES:STRING="superlu_4.0" \
#-D ShyLU_ENABLE_Tests:BOOL=ON \
# -D BUILD_SHARED_LIBS:BOOL=ON \
#-D BUILD_SHARED_LIBS:BOOL=ON \
#-D TPL_ParMETIS_LIBRARIES="-lparmetis -lmetis" \
#-D TPL_SuperLUDist_LIBRARIES="-lsuperlu_dist" \
# -Wall -Wwrite-strings -Wno-strict-aliasing -Wno-unknown-pragmas
#-D TPL_ENABLE_SuperLUDist:BOOL=ON \
#-D SuperLUDist_INCLUDE_DIRS:PATH="/home/srajama/installs/SuperLU_DIST_4.3/SRC" \
#-D SuperLUDist_LIBRARY_DIRS:PATH="/home/srajama/installs/SuperLU_DIST_4.3/lib" \
#-D TPL_ENABLE_ParMETIS:BOOL=ON \
#-D ParMETIS_INCLUDE_DIRS:PATH="/home/srajama/installs/parmetis-4.0.3/include" \
#-D ParMETIS_LIBRARY_DIRS:PATH="/home/srajama/installs/parmetis-4.0.3/build/Linux-x86_64/libparmetis/" \
#-D TPL_ENABLE_UMFPACK:BOOL=ON \
#-D UMFPACK_INCLUDE_DIRS:PATH="/home/srajama/installs/SuiteSparse/include" \
#-D UMFPACK_LIBRARY_DIRS:PATH="/home/srajama/installs/SuiteSparse/lib" \
#-D TPL_ParMETIS_LIBRARIES="-lparmetis -lmetis" \
#-D TPL_SuperLUDist_LIBRARIES="-lsuperlu_dist" \
#-D TPL_ENABLE_SuperLUDist:BOOL=ON \
#-D SuperLUDist_INCLUDE_DIRS:PATH="/home/chachen/Softwares/SuperLU_DIST_5.1.0/SRC" \
#-D SuperLUDist_LIBRARY_DIRS:PATH="/home/chachen/Softwares/SuperLU_DIST_5.1.0/lib" \
#-D TPL_ENABLE_ParMETIS:BOOL=ON \
#-D ParMETIS_INCLUDE_DIRS:PATH="/home/chachen/Softwares/parmetis-4.0.3_32bit/build/include" \
#-D ParMETIS_LIBRARY_DIRS:PATH="/home/chachen/Softwares/parmetis-4.0.3_32bit/build/lib" \
#-D TPL_ENABLE_SuperLU:BOOL=ON \
#-D SuperLU_INCLUDE_DIRS:PATH="/home/chachen/Softwares/SuperLU_4.3/SRC" \
#-D SuperLU_LIBRARY_DIRS:PATH="/home/chachen/Softwares/SuperLU_4.3/lib" \
#-D CMAKE_INSTALL_PREFIX:STRING="/home/chachen/Softwares/Trilinos/amesos2_build" \
#-D CMAKE_CXX_FLAGS:STRING="-DFAST_DEVELOPMENT_UNIT_TEST_BUILD -Wall -ansi -pedantic -Werror -Wno-unknown-pragmas -Wno-narrowing -Wno-pragmas -Wno-delete-non-virtual-dtor -Wno-deprecated -Wwrite-strings -Wno-strict-aliasing" \
#
# (cholmod depends on amd)
# (Amesos2_EXPERIMENTAL must be enabled to use cholmod)
#-D TPL_ENABLE_Cholmod:BOOL=ON \
#-D Amesos2_ENABLE_Experimental:BOOL=ON \
#-D Cholmod_INCLUDE_DIRS:PATH="/home/chachen/Softwares/SuiteSparse_gcc_4.7.2/include" \
#-D Cholmod_LIBRARY_DIRS:PATH="/home/chachen/Softwares/SuiteSparse_gcc_4.7.2/CHOLMOD/Lib" \
#-D CMAKE_CXX_FLAGS:STRING="-L/home/chachen/Softwares/SuiteSparse_gcc_4.7.2/lib -lamd -lsuitesparseconfig -lcholmod" \
#
# (UMFPACK depends on amd and cholmod)
#-D TPL_ENABLE_UMFPACK:BOOL=ON \
#-D UMFPACK_INCLUDE_DIRS:PATH="/home/chachen/Softwares/SuiteSparse_gcc_4.7.2/include" \
#-D UMFPACK_LIBRARY_DIRS:PATH="/home/chachen/Softwares/SuiteSparse_gcc_4.7.2/UMFPACK/Lib" \
#-D CMAKE_CXX_FLAGS:STRING="-L/home/chachen/Softwares/SuiteSparse_gcc_4.7.2/lib -lamd -lsuitesparseconfig -lcholmod" \
/bin/rm -r cmake* CMake* CPack* CTest* Dart* Trilinos* Testing packages Makefile

cmake \
-D CMAKE_INSTALL_PREFIX:STRING=$(pwd) \
-D TPL_ENABLE_MPI:BOOL=ON \
-D CMAKE_VERBOSE_MAKEFILE=1 \
-D Trilinos_ENABLE_ALL_PACKAGES:BOOL=OFF \
-D BUILD_SHARED_LIBS:BOOL=OFF \
-D Trilinos_ENABLE_EXAMPLES:BOOL=ON \
-D Trilinos_ENABLE_Amesos2=ON \
-D Trilinos_ENABLE_Amesos=ON \
-D Teuchos_ENABLE_COMPLEX:BOOL=OFF \
-D Amesos2_ENABLE_TIMERS:BOOL=ON \
-D Amesos2_ENABLE_KLU2:BOOL=ON \
-D Amesos2_ENABLE_Basker:BOOL=ON \
-D Amesos2_ENABLE_TESTS:BOOL=ON \
-D Amesos2_ENABLE_EXAMPLES:BOOL=ON \
-D TPL_ENABLE_SuperLU:BOOL=ON \
-D SuperLU_INCLUDE_DIRS:PATH="/home/chachen/Softwares/SuperLU_4.3_gcc_4.7.2/SRC" \
-D SuperLU_LIBRARY_DIRS:PATH="/home/chachen/Softwares/SuperLU_4.3_gcc_4.7.2/lib" \
-D TPL_ENABLE_PARDISO_MKL:BOOL=ON \
-D PARDISO_MKL_INCLUDE_DIRS:PATH="/opt/intel/composer_xe_2011_sp1.9.293/mkl/include" \
-D PARDISO_MKL_LIBRARY_DIRS:PATH="/opt/intel/composer_xe_2011_sp1.9.293/mkl/lib/intel64" \
-D CMAKE_CXX_FLAGS:STRING="-L/opt/intel/composer_xe_2011_sp1.9.293/mkl/lib/intel64 -lmkl_lapack95_lp64 -lmkl_intel_lp64 -lmkl_core -lmkl_sequential" \
-D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=OFF \
-D AMESOS2_EXPLICIT_INSTANTIATION:BOOL=ON \
.. |& tee OUTPUT.CMAKE

make -j 36 |& tee OUTPUT.MAKE
make install |& tee OUTPUT.INSTALL


