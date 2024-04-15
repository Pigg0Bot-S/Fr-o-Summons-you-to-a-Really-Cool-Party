shader_type canvas_item;

const vec4 outline_mask = vec4(0.0, 0.0, 0.0, 1.0);
uniform vec4 outline_color : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform vec4 text_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	
	vec3 color_diff = abs(tex_color.rgb - outline_mask.rgb);
	
	float diff_magnitude = length(color_diff);
	
	if (tex_color.a == 0.0) {
		discard;
	}
	
	if (diff_magnitude == 0.0) {
		COLOR = outline_color;
	}
	else {
		COLOR = tex_color.rgba*text_color;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
