void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("JoltPhysics");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE");

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"."
	});

	properties.files({
		"./Jolt/**.h",
		"./Jolt/**.cpp",

		"./Jolt/**.natvis"
	});

	{
		MultiBuild::ScopedFilter _(project, "project.compiler:VisualCpp");
		properties.build_options({ "/Zc:__cplusplus", "/Gm-", "/MP", "/nologo", "/FC", "/fp:except-", "/Zc:inline", "/GR-" });
	}
}