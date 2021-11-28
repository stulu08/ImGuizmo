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
		"ImGuizmo.h",
		"ImGuizmo.cpp",
		"ImCurveEdit.cpp",
		"ImCurveEdit.h",
		"ImGradient.cpp",
		"ImGradient.h",
		"ImSequencer.h",
		"ImSequencer.cpp"
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
