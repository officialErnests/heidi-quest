shader_type canvas_item;

void fragment() {
	//float mul = (sin(TIME + UV.x + sin(UV.y * TIME * 0.2f)) * 0.5f + 0.5);
	float mul = sin(TIME) + cos(TIME);
	COLOR = vec4(mul, mul, mul, 1);
	//COLOR = vec4(0.2f - mul * 0.2f, abs(COLOR.g * mul * floor(sin(TIME * UV.y / 10.f * UV.x) * 10.f) / 10.f) * 2.f + 0.6f + mul / 10.f, 0.6f + mul / 10.f, 1);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
