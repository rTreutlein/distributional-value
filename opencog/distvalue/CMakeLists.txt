ADD_LIBRARY (distvalue
	DVecUtils.cc
	CoverTree.cc
)

TARGET_LINK_LIBRARIES(distvalue
	${COGUTIL_LIBRARY}
)

INSTALL (TARGETS distvalue
    EXPORT DISTVTargets
	DESTINATION "lib${LIB_DIR_SUFFIX}/opencog"
)

INSTALL (FILES
	DVecUtils.h
	CoverTree.h
	DESTINATION "include/opencog/atoms/distvalue"
)