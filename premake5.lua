include "freetype"

project "msdfgen"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
    	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"core/**.h",
		"core/**.hpp",
		"core/**.cpp",
		"ext/**.h",
		"ext/**.hpp",
		"ext/**.cpp",
		"lib/**.cpp",
		"include/**.h"
	}

	includedirs
	{
		"include",
		"freetype/include"
	}

	defines
	{
		"MSDFGEN_USE_CPP11"
	}

	links
	{
		"freetype"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug-OpenGL"
		runtime "Debug"
		symbols "on"

	filter "configurations:Debug-Vulkan"
		runtime "Debug"
		symbols "on"

	filter "configurations:Debug-DX11"
		runtime "Debug"
		symbols "on"

	filter "configurations:Debug-DX12"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release-OpenGL"
		runtime "Release"
		optimize "on"

	filter "configurations:Release-Vulkan"
		runtime "Release"
		optimize "on"
		
	filter "configurations:Release-DX11"
		runtime "Release"
		optimize "on"

	filter "configurations:Release-DX12"
		runtime "Release"
		optimize "on"

