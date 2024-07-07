void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	properties.name("JoltPhysics");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	properties.license("./LICENSE");

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
		MultiBuild::ScopedFilter _(workspace, "project.compiler:VisualCpp");
		properties.build_options({ "/Zc:__cplusplus", "/Gm-", "/MP", "/nologo", "/FC", "/fp:except-", "/Zc:inline", "/GR-" });
	}
}