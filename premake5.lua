include "../../premake/common_premake_defines.lua"

project "JoltPhysics"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	files {
		"./Jolt/**.h",
		"./Jolt/**.cpp",

		"./Jolt/**.natvis"
	}

	includedirs {
		"%{IncludeDir.jolt_physics}"
	}
