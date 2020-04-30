group "Dependencies"
	include "HazelAudio/vendor/OpenAL-Soft"
	include "HazelAudio/vendor/libogg"
	include "HazelAudio/vendor/Vorbis"
group ""

project "HazelAudio"
	location "HazelAudio"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
		"AL_LIBTYPE_STATIC"
	}

	includedirs
	{
		"%{prj.name}/src",
		"HazelAudio/vendor/OpenAL-Soft/include",
		"HazelAudio/vendor/OpenAL-Soft/src",
		"HazelAudio/vendor/OpenAL-Soft/src/common",
		"HazelAudio/vendor/libogg/include",
		"HazelAudio/vendor/Vorbis/include",
		"HazelAudio/vendor/minimp3"
	}

	links
	{
		"OpenAL-Soft",
		"Vorbis"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "HZ_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "HZ_RELEASE"
		runtime "Release"
		optimize "on"
		buildoptions {
            "/O2", "/Ob2", "/Ot", "/Oy", "/GT", "/LTCG", "/GL"
        }

	filter "configurations:Dist"
		defines "HZ_DIST"
		runtime "Release"
		optimize "on"
		buildoptions {
            "/O2", "/Ob2", "/Ot", "/Oy", "/GT", "/LTCG", "/GL"
        }

