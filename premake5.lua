project "ImGuizmo"
	kind "StaticLib"
    language "C++"
	if(staticRuntime) then
		staticruntime "on"
	end

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	links
	{
		"ImGui"
	}
	includedirs
	{
		"%{IncludeDir.ImGui}"
	}
	files
	{
		"GraphEditor.cpp",
		"GraphEditor.h",
		"ImCurveEdit.cpp",
		"ImCurveEdit.h",
		"ImGradient.cpp",
		"ImGradient.h",
		"ImGuizmo.h",
		"ImGuizmo.cpp",
		"ImSequencer.h",
		"ImSequencer.cpp",
		"ImZoomSlider.h",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
		symbols "off"

